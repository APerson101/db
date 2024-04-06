import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/providers/getters.dart';
import 'package:pluto_grid/pluto_grid.dart';

class QFormView extends ConsumerStatefulWidget {
  QFormView({this.maxDate, this.minDate, this.search});
  final String? search, minDate, maxDate;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _QFormViewState();
  }
}

class _QFormViewState extends ConsumerState<QFormView> {
  _QFormViewState({this.maxDate, this.minDate, this.search});
  final String? search, minDate, maxDate;
  @override
  Widget build(BuildContext context) {
    return ref.watch(getReportsProvider(search, minDate, maxDate)).when(
        data: (data) {
          Map<String, dynamic> mapped = {};
          Map<String, List<dynamic>> mappedProducts =
              data.fold<Map<String, List<dynamic>>>({}, (mapped, item) {
            final productId = item['stockCardProductId'] ?? "";
            mapped[productId] = (mapped[productId] ?? [])..add(item);
            return mapped;
          });

          for (var i = 0; i < mappedProducts.length; i++) {
            final kv = mappedProducts.entries.toList()[i];
            int qIssued = kv.value.fold(
                0,
                (previousValue, element) =>
                    previousValue +
                    (int.tryParse(
                            element['quantityIssued'].toString() ?? "0") ??
                        0));
            int qReceived = kv.value.fold(
                0,
                (previousValue, element) =>
                    previousValue +
                    (int.tryParse(
                            element['quantityReceived'].toString() ?? "0") ??
                        0));
            // int sBalance = kv.value.fold(
            //     0,
            //     (previousValue, element) =>
            //         previousValue +
            //         (int.tryParse(element['stockBalance'].toString() ?? "0") ??
            //             0));
            int sBalance = qReceived - qIssued;
            int lAdjs = kv.value.fold(
                0,
                (previousValue, element) =>
                    previousValue +
                    (int.tryParse(
                            element['lossesAdjustements'].toString() ?? "0") ??
                        0));

            final OpeningMap = <String, int>{};
            final ClosingMap = <String, int>{};
            final ExpiryMap = <String, int>{};

            for (final stockCard in kv.value) {
              final facilityId = stockCard['stockCardProductId'];
              final cardDate = stockCard['date'];
              final expDate = stockCard['expiryDate'];

              if (!OpeningMap.containsKey(facilityId)) {
                OpeningMap[facilityId!] = kv.value.indexOf(stockCard);
              } else {
                OpeningMap[facilityId!] = DateTime.parse(
                            TemporalDateTime.fromString(kv.value
                                    .toList()[OpeningMap[facilityId]!]['date'])
                                .format())
                        .isBefore(DateTime.parse(
                            TemporalDateTime.fromString(cardDate).format()))
                    ? OpeningMap[facilityId]!
                    : kv.value.indexOf(stockCard);
              }

              if (!ClosingMap.containsKey(facilityId)) {
                ClosingMap[facilityId!] = kv.value.indexOf(stockCard);
              } else {
                ClosingMap[facilityId!] = DateTime.parse(
                            TemporalDateTime.fromString(kv.value
                                    .toList()[ClosingMap[facilityId]!]['date']!)
                                .format())
                        .isAfter(DateTime.parse(
                            TemporalDateTime.fromString(cardDate).format()))
                    ? ClosingMap[facilityId]!
                    : kv.value.indexOf(stockCard);
              }
              if (!ExpiryMap.containsKey(facilityId)) {
                ExpiryMap[facilityId!] = kv.value.indexOf(stockCard);
              } else {
                ExpiryMap[facilityId!] = DateTime.parse(TemporalDate.fromString(
                                kv.value.toList()[ExpiryMap[facilityId]!]
                                    ['expiryDate']!)
                            .format())
                        .isBefore(DateTime.parse(
                            TemporalDate.fromString(expDate).format()))
                    ? ExpiryMap[facilityId]!
                    : kv.value.indexOf(stockCard);
              }
            }
            var ob = kv.value[OpeningMap.values.first];
            int openingBalance =
                ((int.tryParse(ob['stockBalance'].toString()) ?? 0) +
                        (int.tryParse(ob['quantityIssued'].toString()) ?? 0)) -
                    (int.tryParse(ob["quantityReceived"].toString()) ?? 0);

            int closingBalance =
                kv.value[ClosingMap.values.first]['stockBalance'];
            String exp = kv.value[ExpiryMap.values.first]['expiryDate'];
            mapped.addAll({
              "name": (mappedProducts.entries.toList()[i]).value[0]['product']
                  ['name'],
              "ob": openingBalance,
              "cb": closingBalance,
              "qi": qIssued,
              "qr": qReceived,
              "sb": sBalance,
              "la": lAdjs,
              "exp": TemporalDate.fromString(exp).format()
            });
          }
          final gridCols = _qFOrm.values
              .map((e) => PlutoColumn(
                  title: e.label,
                  field: e.id,
                  type: switch (e.type) {
                    "text" => PlutoColumnType.text(),
                    "number" => PlutoColumnType.number(),
                    "date" => PlutoColumnType.date(),
                    _ => PlutoColumnType.text()
                  },
                  checkReadOnly: (row, cell) {
                    if (cell.column.field == "pi") {
                      return false;
                    }
                    return true;
                  }))
              .toList();

          final stockRows =
              List.generate(mappedProducts.keys.toList().length, (index) {
            return PlutoRow(
                cells: _qFOrm.values.fold(
                    {},
                    (previousValue, element) => {
                          ...previousValue,
                          element.id: PlutoCell(
                              value: element.id == "sn"
                                  ? index + 1
                                  : mapped[element.id])
                        }));
          });
          return PlutoGrid(
            columns: gridCols,
            rows: stockRows,
            onChanged: (event) {
              // change the losses/adjustements column here
              stockRows[event.rowIdx].cells['la']?.value =
                  stockRows[event.rowIdx].cells['cb']?.value - event.value;
            },
          );
        },
        error: (er, st) {
          debugPrintStack(stackTrace: st);
          return const Center(
            child: Text("Failed to load"),
          );
        },
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()));
  }
}

enum _qFOrm {
  sn(label: "S/N", id: "sn", sample: 5, type: "number"),
  name(
      label: "Product Name", id: "name", sample: "Patient Kit I", type: "text"),
  ob(label: "Opening Balance", id: "ob", sample: 400, type: "number"),
  qr(label: "Quantity Received", id: "qr", sample: 420, type: "number"),
  qi(label: "Quantity Issued", id: "qi", sample: 420, type: "number"),
  la(label: "Losses/Adjustments", id: "la", sample: 420, type: "number"),
  cb(label: "Closing Stock", id: "cb", sample: 420, type: "number"),
  pi(label: "Physical Inventory", id: "pi", sample: 0, type: "number"),
  exp(label: "Nearest Exp date", id: "exp", sample: "2012-12-12", type: "date"),
  mosc(label: "Month of stock cover", id: "mosc", sample: ".7", type: "text"),
  rem(label: "Remarks", id: "rem", sample: "Sample remark", type: "text");

  const _qFOrm(
      {required this.label,
      required this.id,
      required this.sample,
      required this.type});

  final String label;
  final String id;
  final dynamic sample;
  final String type;
}
