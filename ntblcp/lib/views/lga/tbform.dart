import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/providers/creators.dart';
import 'package:ntblcp/providers/getters.dart';
import 'package:pluto_grid/pluto_grid.dart';

class TBFormEntry extends ConsumerWidget {
  const TBFormEntry({super.key, required this.lga});
  final String lga;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(getLocationFacilitiesProvider(
          '{lga:"$lga"}',
        ))
        .when(
            data: (facilities) {
              final gridCols = _TBTable.values
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
                        if (cell.column.field == "cases") {
                          return false;
                        }
                        return true;
                      }))
                  .toList();

              final stockRows = List.generate(20, (index) {
                return PlutoRow(
                    cells: _TBTable.values.fold(
                        {},
                        (previousValue, element) => {
                              ...previousValue,
                              element.id: PlutoCell(value: element.sample)
                            }));
              });

              return Scaffold(
                  appBar: AppBar(
                    actions: [
                      ElevatedButton(
                          onPressed: () async {
                            var ff = facilities
                                .where((element) => ref
                                    .watch(_totalProvider)
                                    .keys
                                    .toList()
                                    .contains(element['id']))
                                .toList();

                            for (var i = 0; i < ff.length; i++) {
                              await ref.watch(recordMEdataProvider({
                                "date": TemporalDate.now().format(),
                                "numberOfCases":
                                    ref.watch(_totalProvider)[ff[i]['id']],
                                "facilityMeDataId": ff[i]['id']
                              }).future);
                            }
                          },
                          child: const Text("Save New data"))
                    ],
                  ),
                  body: SafeArea(
                      child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: 100,
                          child: ListTile(
                            title: const Text("Total cases"),
                            subtitle: Text(
                              ref.watch(_totalVal).toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          )),
                      Positioned(
                        top: 100,
                        left: 0,
                        right: 30,
                        bottom: 10,
                        child: PlutoGrid(
                          columns: gridCols,
                          rows: stockRows,
                          onChanged: (changed) {
                            final changedIndex = changed.rowIdx;
                            ref.watch(_totalProvider.notifier).update((state) {
                              state[changedIndex] = changed.value;
                              state = {...state};
                              var total = state.values.toList();
                              if (total.isNotEmpty) {
                                ref.watch(_totalVal.notifier).state =
                                    total.reduce(
                                        (value, element) => value + element);
                              }
                              return state;
                            });
                          },
                        ),
                      ),
                    ],
                  )));
            },
            error: (er, st) {
              debugPrintStack(stackTrace: st);
              return Center(child: Text("Error"));
            },
            loading: () => Center(
                  child: CircularProgressIndicator.adaptive(),
                ));
  }
}

enum _TBTable {
  sn(label: "S/N", id: "sn", type: "number", sample: 1),
  facility(
      label: "Facility",
      id: "facility",
      type: "text",
      sample: "ABUAD teaching hospital"),
  cases(label: "Cases No", id: "cases", type: "number", sample: 0);

  const _TBTable(
      {required this.label,
      required this.id,
      required this.sample,
      required this.type});
  final String id;
  final dynamic sample;
  final String label;
  final String type;
}

final _totalProvider = StateProvider((ref) => {});
final _totalVal = StateProvider((ref) => 0);
