import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

class QueriesView extends ConsumerWidget {
  const QueriesView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gridCols = _QueriesTable.values
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

    final stockRows = List.generate(20, (index) {
      return PlutoRow(
          cells: _QueriesTable.values.fold(
              {},
              (previousValue, element) => {
                    ...previousValue,
                    element.id: PlutoCell(value: element.sample)
                  }));
    });
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: PlutoGrid(
                columns: gridCols,
                rows: stockRows,
                onSelected: (selected) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return _FaclityQueryDetails();
                  }));
                },
                mode: PlutoGridMode.selectWithOneTap)));
  }
}

enum _QueriesTable {
  sn(label: "S/N", id: "sn", sample: 1, type: "number"),
  facility(
      label: "Facility", id: "facility", sample: "Abuad clinic", type: "text"),
  dd(
      label: "Drug Dispensed\nNo new cases",
      id: "dd",
      sample: 1,
      type: "number"),
  dou(label: "Drug Over\nUnder usage", id: "dou", sample: 1, type: "number"),
  soqe(
      label: "Stocked Out by \nQuartery end",
      id: "soqe",
      sample: 1,
      type: "number"),
  loss(label: "Losses reported", id: "losses", sample: 1, type: "number");

  const _QueriesTable(
      {required this.label,
      required this.id,
      required this.sample,
      required this.type});

  final dynamic label, id, type, sample;
}

class _FaclityQueryDetails extends ConsumerWidget {
  const _FaclityQueryDetails({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gridCols = _FQD.values
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

    final stockRows = List.generate(20, (index) {
      return PlutoRow(
          cells: _FQD.values.fold(
              {},
              (previousValue, element) => {
                    ...previousValue,
                    element.id: PlutoCell(value: element.sample)
                  }));
    });
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: PlutoGrid(
                columns: gridCols,
                rows: stockRows,
                mode: PlutoGridMode.readOnly)));
  }
}

enum _FQD {
  sn(label: "S/N", id: "sn", sample: 1, type: "number"),
  ft(label: "Facility", id: "ft", sample: "Abuad Clinic", type: "text"),
  pk1(label: "Patient Kit 1", id: "pk1", sample: "5", type: "number"),
  pk2(label: "Patient Kit 2", id: "pk2", sample: "5", type: "number"),
  pk3(label: "Patient Kit 3", id: "pk3", sample: "5", type: "number"),
  pk4(label: "Patient Kit 4", id: "pk4", sample: "5", type: "number"),
  pk5(label: "Patient Kit 5", id: "pk5", sample: "5", type: "number");

  const _FQD(
      {required this.label,
      required this.id,
      required this.sample,
      required this.type});

  final dynamic label, id, sample, type;
}
