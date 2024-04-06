import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/providers/dataprovider.dart';
import 'package:ntblcp/providers/getters.dart';
import 'package:ntblcp/views/shared/qform.dart';
import 'package:pluto_grid/pluto_grid.dart';

class InventoryView extends ConsumerWidget {
  const InventoryView(
      {super.key, required this.facility, required this.inventoryId});
  final String facility;
  final String inventoryId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getInventoryProvider(inventoryId)).when(
        data: (inventory) {
          Map<String, List<dynamic>> map = {};
          for (var item in inventory) {
            if (map.containsKey(item['name'])) {
              map[item['name']]!.add(item);
            } else {
              map.addAll({
                item['name']: [item]
              });
            }
          }

          final cols = _Inventory.values
              .map((e) => PlutoColumn(
                  title: e.label,
                  field: e.id,
                  type: switch (e.type) {
                    "text" => PlutoColumnType.text(),
                    "number" => PlutoColumnType.number(),
                    "date" => PlutoColumnType.date(),
                    _ => PlutoColumnType.text()
                  }))
              .toList();
          final rows = List.generate(map.keys.length, (index) {
            print(map.entries.toList()[index].value);
            final closetdate = map.entries
                .toList()[index]
                .value
                .map((e) => e['expiry'])
                .reduce((value, element) => (TemporalDate.fromString(value))
                        .getDateTime()
                        .isBefore(
                            TemporalDate.fromString(element).getDateTime())
                    ? value
                    : element);
            return PlutoRow(
                cells: _Inventory.values.fold(
                    {},
                    (previousValue, element) => {
                          ...previousValue,
                          element.id: PlutoCell(
                              value: element.id == "sn"
                                  ? index + 1
                                  : element.id == "quantity"
                                      ? map.entries
                                          .toList()[index]
                                          .value
                                          .map((e) => e['quantity'])
                                          .reduce((value, element) =>
                                              value + element)
                                      : element.id == "expiry"
                                          ? closetdate
                                          : inventory[index][element.id])
                        }));
          });
          return Scaffold(
              appBar: AppBar(
                actions: [
                  ChoiceChip(
                      onSelected: (value) {
                        ref.watch(_currentViewSelection.notifier).state = 0;
                      },
                      label: Text("Inventory"),
                      selected: ref.watch(_currentViewSelection) == 0),
                  ChoiceChip(
                      onSelected: (value) {
                        ref.watch(_currentViewSelection.notifier).state = 1;
                      },
                      label: const Text("Quarterly Report"),
                      selected: ref.watch(_currentViewSelection) == 1)
                ],
              ),
              body: ref.watch(_currentViewSelection) == 0
                  ? SafeArea(
                      child: PlutoGrid(
                      onSelected: (event) {
                        event.rowIdx;
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return _InventoryView(
                              facility: facility,
                              batches: inventory
                                  .where((element) =>
                                      element['pQuantityProductId'] ==
                                      map.entries
                                          .toList()[ref.watch(_selectedProduct)]
                                          .value[0]['pQuantityProductId'])
                                  .toList(),
                              product: inventory[event.rowIdx!]["id"]);
                        }));
                      },
                      mode: PlutoGridMode.selectWithOneTap,
                      columns: cols,
                      rows: rows,
                    ))
                  : QFormView());
        },
        error: (er, st) {
          debugPrintStack(stackTrace: st);
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Failed to load"),
              IconButton(
                  onPressed: () {
                    ref.invalidate(getInventoryProvider(inventoryId));
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ));
        },
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()));
  }
}

enum _Inventory {
  sn(label: "S/N", id: "sn", type: "number", sample: 1),
  product(label: "Name", id: "name", type: "text", sample: "Patient Kit I"),
  quantity(label: "Quantity", id: "quantity", type: "number", sample: 6),
  expiry(
      label: "Closest Expiry Date",
      id: "expiry",
      type: "date",
      sample: "2012-12-12");

  const _Inventory(
      {required this.label,
      required this.id,
      required this.type,
      required this.sample});
  final String label;
  final String id;
  final dynamic sample;
  final String type;
}

class _InventoryView extends ConsumerWidget {
  const _InventoryView(
      {required this.facility, required this.product, required this.batches});
  final String facility;
  final String product;
  final List<dynamic> batches;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(batches.length);
    print(batches);
    final batchesCol = _PBatches.values
        .map((e) => PlutoColumn(
            title: e.label,
            field: e.id,
            type: switch (e.type) {
              "text" => PlutoColumnType.text(),
              "number" => PlutoColumnType.number(),
              "date" => PlutoColumnType.date(),
              _ => PlutoColumnType.text()
            }))
        .toList();
    final batchesRows = List.generate(batches.length, (index) {
      return PlutoRow(
          cells: _PBatches.values.fold(
              {},
              (previousValue, element) => {
                    ...previousValue,
                    element.id: PlutoCell(
                        value: element.id == "sn"
                            ? index + 1
                            : batches[index][element.id])
                  }));
    });
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Stack(children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Row(children: [
                ChoiceChip(
                    onSelected: (value) {
                      ref.watch(_batchViewProvider.notifier).state = 0;
                    },
                    label: const Text("Product Batches"),
                    selected: ref.watch(_batchViewProvider) == 0),
                ChoiceChip(
                    onSelected: (value) {
                      ref.watch(_batchViewProvider.notifier).state = 1;
                    },
                    label: const Text("Stock Card"),
                    selected: ref.watch(_batchViewProvider) == 1),
              ]),
            ),
            Positioned(
                top: 50,
                left: 0,
                right: 0,
                bottom: 10,
                child: ref.watch(_batchViewProvider) == 0
                    ? PlutoGrid(
                        columns: batchesCol,
                        rows: batchesRows,
                        mode: PlutoGridMode.readOnly,
                      )
                    : _StockCardView(
                        facilityId: facility,
                        productId: product,
                      ))
          ]),
        ));
  }
}

enum _PBatches {
  sn(label: "S/N", id: "sn", type: "number", sample: 1),
  quantity(label: "Quantity Left", id: "quantity", type: "number", sample: 6),
  batch(label: "Batch no", id: "batch", type: "text", sample: "343n7n"),
  expiry(
      label: "Expiry Date", id: "expiry", type: "date", sample: "2012-12-12");

  const _PBatches(
      {required this.label,
      required this.id,
      required this.type,
      required this.sample});
  final String label;
  final String id;
  final dynamic sample;
  final String type;
}

final _batchViewProvider = StateProvider<int>((ref) {
  return 0;
});

class _StockCardView extends ConsumerWidget {
  const _StockCardView({required this.facilityId, required this.productId});
  final String facilityId, productId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(getFacilityProductStockCardProvider(facilityId, productId))
        .when(
            data: (stockCards) {
              final stockcols = _StockCardTable.values
                  .map((e) => PlutoColumn(
                      title: e.label,
                      field: e.id,
                      type: switch (e.type) {
                        "text" => PlutoColumnType.text(),
                        "number" => PlutoColumnType.number(),
                        "date" => PlutoColumnType.date(),
                        _ => PlutoColumnType.text()
                      }))
                  .toList();
              final stockRows = List.generate(stockCards.length, (index) {
                return PlutoRow(
                    cells: _StockCardTable.values.fold({},
                        (previousValue, element) {
                  if ((stockCards[index]['type'] == "INCOMING" &&
                          element.id == "sender") ||
                      (stockCards[index]['type'] == "OUTGOING" &&
                          element.id == "receiver")) {
                    return {
                      ...previousValue,
                      element.id:
                          PlutoCell(value: stockCards[index]["receiver"])
                    };
                  }
                  if ((stockCards[index]['type'] == "INCOMING" &&
                          element.id == "receiver") ||
                      (stockCards[index]['type'] == "OUTGOING" &&
                          element.id == "sender")) {
                    return {...previousValue, element.id: PlutoCell(value: "")};
                  }
                  return {
                    ...previousValue,
                    element.id: PlutoCell(
                        value: element.id == "sn"
                            ? index + 1
                            : stockCards[index][element.id])
                  };
                }));
              });
              return SafeArea(
                  child: PlutoGrid(
                mode: PlutoGridMode.readOnly,
                columns: stockcols,
                rows: stockRows,
              ));
            },
            error: (er, st) {
              debugPrintStack(stackTrace: st);
              return const Center(child: Text("Failed to load"));
            },
            loading: () => Center(
                  child: CircularProgressIndicator.adaptive(),
                ));
  }
}

enum _StockCardTable {
  sn(label: "S/N", id: "sn", sample: 1, type: "number"),
  qIssued(
      label: "Quantity Issued",
      id: "quantityIssued",
      sample: 4,
      type: "number"),
  qReceived(
      label: "Quantity Received",
      id: "quantityReceived",
      sample: 4,
      type: "number"),
  date(label: "Date", id: "date", sample: "2012-12-12", type: "date"),
  stockBalance(
      label: "Stock Balance", id: "stockBalance", sample: 8, type: "number"),
  // lAdj(
  //     label: "Losses/Adjustements",
  //     id: "lossesAdjustements",
  //     sample: 9,
  //     type: "number"),
  batchNo(label: "batch no", id: "batchNo", sample: "132132", type: "text"),
  expiry(
      label: "Expiry Date",
      id: "expiryDate",
      sample: "2022-12-12",
      type: "date"),
  receiver(
      label: "Receiver",
      id: "receiver",
      sample: "Patient: Abba Baba",
      type: "text"),
  sender(
      label: "Sender",
      id: "sender",
      sample: "Patient: Abba Baba",
      type: "text");

  const _StockCardTable(
      {required this.id,
      required this.label,
      required this.sample,
      required this.type});
  final String label;
  final String id;
  final String type;
  final dynamic sample;
}

final _currentViewSelection = StateProvider((ref) => 0);
final _selectedProduct = StateProvider((ref) => 0);
