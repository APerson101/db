import 'package:collection/collection.dart' as collection;
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/providers/dataprovider.dart';
import 'package:pluto_grid/pluto_grid.dart';

class PendingSupplies extends ConsumerWidget {
  const PendingSupplies({
    super.key,
    required this.isReceiver,
    required this.items,
    required this.facilityId,
    required this.inventoryID,
  });
  final bool isReceiver;
  final List<dynamic> items;
  final String facilityId, inventoryID;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cols = _column.values.toList();
    cols.remove(isReceiver ? _column.receiver : _column.sender);
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: PlutoGrid(
          onSelected: (event) {
            final selectedRow = event.rowIdx;
            if (selectedRow != null) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return _PendingDeliveries(
                  item: items[selectedRow],
                  facilityId: facilityId,
                  inventoryID: inventoryID,
                  senderName: items[selectedRow]['sender']['name'],
                  supplyId: items[selectedRow]['id'],
                );
              }));
            }
          },
          mode: PlutoGridMode.selectWithOneTap,
          columns: cols
              .map((e) => PlutoColumn(
                  title: e.label,
                  field: e.id,
                  type: switch (e.type) {
                    "text" => PlutoColumnType.text(),
                    "number" => PlutoColumnType.number(),
                    "date" => PlutoColumnType.date(),
                    "list" => PlutoColumnType.select(
                        ["Waiting for receiver", "success"]),
                    _ => PlutoColumnType.text()
                  }))
              .toList(),
          rows: [
            ...List.generate(
                items.length,
                (index) => PlutoRow(
                        cells: {
                      _column.sn.id: PlutoCell(value: index + 1),
                      // _column.sender.id: PlutoCell(value: "National Warehouse"),
                      // _column.receiver.id: PlutoCell(value: "ABUAD Warehouse"),
                      _column.quantity.id: PlutoCell(
                          value: items[index]['products'].length.toString()),
                      _column.date.id:
                          PlutoCell(value: items[index]['sendDate']),
                    }..addAll(isReceiver
                            ? {
                                _column.sender.id: PlutoCell(
                                    value: items[index]['sender']['name'])
                              }
                            : {
                                _column.receiver.id:
                                    PlutoCell(value: "ABUAD Warehouse")
                              })))
          ],
        )));
  }
}

// supply list stats:: on click, if receiver, take you to confirmation page, otherwise do nothing

enum _column {
  sn(label: "S/N", id: "sn", type: "number"),
  sender(label: "Sender", id: "sender", type: "text"),
  receiver(label: "Receiver", id: "receiver", type: "text"),
  quantity(label: "Quantity", id: "items", type: "number"),
  date(label: "Date", id: "date", type: "date");

  const _column({required this.label, required this.id, required this.type});

  final String label;
  final String id;
  final String type;
}

class _PendingDeliveries extends ConsumerWidget {
  const _PendingDeliveries(
      {required this.item,
      required this.facilityId,
      required this.inventoryID,
      required this.senderName,
      required this.supplyId});
  final Map<String, dynamic> item;
  final String supplyId;
  final String senderName;
  final String facilityId;
  final String inventoryID;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cols = _DeliveryItems.values.map((e) {
      return PlutoColumn(
          title: e.label,
          field: e.id,
          checkReadOnly: (row, cell) {
            if (cell.column.field != "quantity") {
              return true;
            }
            return false;
          },
          type: switch (e.type) {
            "text" => PlutoColumnType.text(),
            "number" => PlutoColumnType.number(),
            "date" => PlutoColumnType.date(),
            _ => PlutoColumnType.text()
          });
    }).toList();
    final rows = List.generate(item['products'].length, (index) {
      return PlutoRow(
        cells: {
          _DeliveryItems.sn.id: PlutoCell(value: index + 1),
          _DeliveryItems.product.id:
              PlutoCell(value: item['products'][index]['product']['name']),
          _DeliveryItems.quantity.id:
              PlutoCell(value: item['products'][index]['quantity']),
          _DeliveryItems.batch.id:
              PlutoCell(value: item['products'][index]['batch']),
          _DeliveryItems.expiry.id:
              PlutoCell(value: item['products'][index]['expiryDate']),
          _DeliveryItems.remarks.id: PlutoCell(value: ""),
        },
      );
    });
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Confirm supply"),
                          content: const Text("Confirm all supplies received?"),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  final inv = await ref.watch(
                                      getInventoryProvider(inventoryID).future);
                                  final grouped = collection.groupBy(
                                      inv, (p0) => p0['id'] as String);

                                  List<Map<String, dynamic>> sheet = [];
                                  List<Map<String, dynamic>> discrepancy = [];
                                  for (var i = 0;
                                      i < item['products'].length;
                                      i++) {
                                    var current = item['products'][i];
                                    int stockBalance = 0;
                                    final sent = int.parse(current['quantity']);
                                    final received = ref
                                            .watch(_verificationIndexes)
                                            .keys
                                            .contains("$i")
                                        ? int.parse(ref
                                            .watch(_verificationIndexes)["$i"])
                                        : int.parse(current['quantity']);
                                    if (sent != received) {
                                      // delivery - descripancy
                                      discrepancy.add({
                                        "discrepancySupplyId": item['id'],
                                        "sent": sent,
                                        "received": received,
                                      });
                                    }

                                    try {
                                      stockBalance =
                                          grouped[current['product']['id']]
                                              ?.map((e) => e['quantity'])
                                              .reduce((value, element) =>
                                                  value + element);
                                      stockBalance += (ref
                                              .watch(_verificationIndexes)
                                              .keys
                                              .contains("$i")
                                          ? ref
                                              .watch(_verificationIndexes)["$i"]
                                          : current['quantity']) as int;
                                    } catch (_) {
                                      stockBalance = ref
                                              .watch(_verificationIndexes)
                                              .keys
                                              .contains("$i")
                                          ? int.parse(ref.watch(
                                              _verificationIndexes)["$i"])
                                          : int.parse(current['quantity']);
                                    }
                                    sheet.add({
                                      'productId': current['product']['id'],
                                      'batchNo': current['batch'],
                                      'batchId': current['id'],
                                      'expiryDate': current['expiryDate'],
                                      'stockBalance': stockBalance,
                                      'date': TemporalDateTime.now().format(),
                                      'quantity': ref
                                              .watch(_verificationIndexes)
                                              .keys
                                              .contains("$i")
                                          ? ref
                                              .watch(_verificationIndexes)["$i"]
                                          : current['quantity']
                                    });
                                  }
                                  final data = {
                                    "data": sheet,
                                    "inventoryID": inventoryID,
                                    "facilityId": facilityId,
                                    "senderName": senderName,
                                    "supplyId": supplyId,
                                  };
                                  ref.watch(confirmSuppliesProvider(
                                      data, discrepancy));
                                  if (context.mounted) {
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: Text("YES")),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("NO"))
                          ],
                        );
                      });
                },
                child: const Text("CONFIRM"))
          ],
        ),
        body: SafeArea(
            child: PlutoGrid(
          rowColorCallback: (callback) {
            return item['products'][callback.rowIdx]['quantity'] !=
                    callback.row.cells['quantity']?.value
                ? Colors.redAccent
                : Colors.white;
          },
          onChanged: (changed) {
            final changedIndex = changed.rowIdx;
            if (changed.value != item['products'][changed.rowIdx]['quantity']) {
              rows[changedIndex].cells['remarks']?.value =
                  "${changed.oldValue} sent,  ${changed.value} received";
              ref.watch(_verificationIndexes.notifier).update((state) {
                state["$changedIndex"] = changed.value;
                state = {...state};
                return state;
              });
            } else {
              rows[changedIndex].cells['remarks']?.value = "";
              ref.watch(_verificationIndexes.notifier).update((state) {
                state.remove("$changedIndex");
                state = {...state};
                return state;
              });
            }
          },
          columns: cols,
          rows: rows,
        )));
  }
}

enum _DeliveryItems {
  sn(label: 'S/N', id: "sn", type: "number", sample: 1),
  batch(label: 'Batch', id: "batch", type: "text", sample: "2121"),
  product(
      label: 'Product Name',
      id: "product",
      type: "text",
      sample: "Patient Kit I"),
  expiry(
      label: 'Expiry date', id: "expiry", type: "date", sample: "2022-12-12"),

  quantity(label: 'Quantity', id: "quantity", type: "number", sample: 12),
  remarks(label: 'remarks', id: "remarks", type: "text", sample: " ");

  const _DeliveryItems(
      {required this.label,
      required this.id,
      required this.type,
      required this.sample});

  final String label;
  final String id;
  final String type;
  final dynamic sample;
}

final _verificationIndexes = StateProvider.autoDispose((ref) => {});
