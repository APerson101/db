import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/providers/getters.dart';
import 'package:ntblcp/views/shared/inventoryview.dart';
import 'package:pluto_grid/pluto_grid.dart';

class FacilitiesDataView extends ConsumerWidget {
  const FacilitiesDataView({super.key, required this.location});
  final dynamic location;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            ChoiceChip(
                label: Text("Contact"),
                selected: ref.watch(_viewSelectionProvider) == 0,
                onSelected: (value) {
                  ref.watch(_viewSelectionProvider.notifier).state = 0;
                }),
            ChoiceChip(
                label: Text("Microscopes"),
                selected: ref.watch(_viewSelectionProvider) == 1,
                onSelected: (value) {
                  ref.watch(_viewSelectionProvider.notifier).state = 1;
                }),
            ChoiceChip(
                label: Text("Facility Training"),
                selected: ref.watch(_viewSelectionProvider) == 2,
                onSelected: (value) {
                  ref.watch(_viewSelectionProvider.notifier).state = 2;
                }),
          ],
        ),
        body: SafeArea(
            child: ref.watch(getLocationFacilitiesProvider(location)).when(
                data: (facilities) {
          if (ref.watch(_viewSelectionProvider) == 0) {
            return _DataView(facilities: facilities);
          }
          if (ref.watch(_viewSelectionProvider) == 1) {
            return _MicroscopeTable(facilities: facilities);
          } else {
            return _TrainingTable(facilities: facilities);
          }
        }, error: (er, st) {
          debugPrintStack(stackTrace: st);
          return const Center(child: Text("error"));
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        })));
  }
}

enum _FacilitiesTable {
  sn(label: "S/N", type: "number", sample: 1, id: "sn"),
  name(
      label: "Facility Name", type: "text", sample: "Abuad Clinic", id: "name"),
  location(label: "Location", type: "text", sample: "Ado", id: "lga"),
  contact(
      label: "Contact Name",
      type: "text",
      sample: "Mrs Adeitan",
      id: "contactName"),
  email(
      label: "Email", type: "text", sample: "Mrs Adeitan", id: "contactEmail"),
  cd(label: "Contact Cadre", type: "text", sample: "NURSE", id: "cadre"),
  p1(
      label: "Phone no 1",
      type: "text",
      sample: "081232312323",
      id: "contactPhone1"),
  p2(
      label: "Phone no 2",
      type: "text",
      sample: "081232312323",
      id: "contactPhone2"),
  cat(label: "Level", type: "text", sample: "PHC-PPM", id: "level"),
  op(label: "Operator", type: "text", sample: "PHC-PPM", id: "operation"),
  tb(label: "Operator", type: "text", sample: "PHC-PPM", id: "tbhiv"),
  mic(label: "Microscopy", type: "text", sample: "PHC-PPM", id: "microscopy"),
  miccont(
      label: "Microscopy Contact Name",
      type: "text",
      sample: "PHC-PPM",
      id: "micName"),
  miccontn1(
      label: "Microscopist Email",
      type: "text",
      sample: "PHC-PPM",
      id: "micEmail"),
  miccontn2(
      label: "Microscopist Number 1",
      type: "text",
      sample: "PHC-PPM",
      id: "micNo1"),
  miccontn3(
      label: "Microscopist Number 2",
      type: "text",
      sample: "PHC-PPM",
      id: "micNo2"),
  amountMicro(
      label: "No of microscopes", type: "number", sample: 4, id: "microscopes");

  const _FacilitiesTable(
      {required this.label,
      required this.type,
      required this.sample,
      required this.id});
  final dynamic label, type, id, sample;
}

enum _TrainingInfo {
  sn(label: "S/N", sample: 1, type: "number", id: "sn"),
  namr(label: "Facility Name", sample: 1, type: "text", id: "facility"),
  trainingName(
      label: "Training Name", sample: "THBIV", type: "text", id: "type"),
  status(label: "Status", sample: "THBIV", type: "text", id: "status"),
  date(label: "Training date", sample: "2023-12-12", type: "date", id: "date");

  const _TrainingInfo(
      {required this.label,
      required this.sample,
      required this.id,
      required this.type});
  final dynamic label, sample, id, type;
}

enum _MicroscopesInfo {
  sn(label: "S/N", sample: 1, type: "number", id: "sn"),
  faciltiy(label: "Facility", sample: 'AUAD', type: "text", id: "facility"),
  status(
      label: "Microscope Status",
      sample: "FUNCTIONAL",
      type: "text",
      id: "status"),
  source(label: "Source", sample: "FMoH", type: "text", id: "source"),
  date(label: "Date acquired", sample: "2023-12-12", type: "date", id: "date");

  const _MicroscopesInfo(
      {required this.label,
      required this.sample,
      required this.id,
      required this.type});
  final dynamic label, sample, id, type;
}

final _viewSelectionProvider = StateProvider<int>((ref) {
  return 1;
});

class _DataView extends ConsumerWidget {
  const _DataView({super.key, required this.facilities});
  final List facilities;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gridCols = _FacilitiesTable.values
        .map((e) => PlutoColumn(
              title: e.label,
              field: e.id,
              type: switch (e.type) {
                "text" => PlutoColumnType.text(),
                "number" => PlutoColumnType.number(),
                "date" => PlutoColumnType.date(),
                _ => PlutoColumnType.text()
              },
            ))
        .toList();
    final row = List.generate(facilities.length, (index) {
      return PlutoRow(
          cells: _FacilitiesTable.values.fold({}, (previousValue, element) {
        dynamic text;
        var contact = facilities[index]['contact'];
        var microscopist = facilities[index]['microscopyContact'];
        text = switch (element.id) {
          "sn" => index + 1,
          "contactName" => contact['name'],
          "contactEmail" => contact['email'],
          "cadre" => contact['cadre'],
          "contactPhone1" => contact['primaryNumber'],
          "contactPhone2" => contact['secondaryNumber'],
          "micName" => microscopist?['name'] ?? "",
          "micEmail" => microscopist?['email'] ?? "",
          "micNo1" => microscopist?['primaryNumber'] ?? "",
          "micNo2" => microscopist?['secondaryNumber'] ?? "",
          "microscopes" => facilities[index]['microscopesInfo']?.length ?? 0,
          _ => facilities[index][element.id]
        };
        return {...previousValue, element.id: PlutoCell(value: text)};
      }));
    });

    return SafeArea(
        child: PlutoGrid(
      onSelected: (event) {
        event.rowIdx;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return InventoryView(
            facility: facilities[event.rowIdx!]['id'],
            inventoryId: "test",
          );
        }));
      },
      mode: PlutoGridMode.selectWithOneTap,
      columns: gridCols,
      rows: row,
    ));
  }
}

class _MicroscopeTable extends ConsumerWidget {
  const _MicroscopeTable({super.key, required this.facilities});
  final List facilities;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gridCols = _MicroscopesInfo.values
        .map((e) => PlutoColumn(
              title: e.label,
              field: e.id,
              type: switch (e.type) {
                "text" => PlutoColumnType.text(),
                "number" => PlutoColumnType.number(),
                "date" => PlutoColumnType.date(),
                _ => PlutoColumnType.text()
              },
            ))
        .toList();
    var mappedInfo = [];
    for (var i = 0; i < facilities.length; i++) {
      var e = facilities[i];
      for (var i = 0; i < (e['microscopesInfo'] as List).length; i++) {
        final microInfo = e['microscopesInfo'][i];
        mappedInfo.add({
          "sn": i + 1,
          "facility": e['name'] ?? "",
          "status": microInfo['status'] ?? "",
          "source": microInfo['source'] ?? "",
          "date": microInfo['dateReceived'] ?? ""
        });
      }
    }
    final row = List.generate(mappedInfo.length, (index) {
      return PlutoRow(
          cells: _MicroscopesInfo.values.fold({}, (previousValue, element) {
        dynamic text = mappedInfo[index][element.id];
        return {...previousValue, element.id: PlutoCell(value: text)};
      }));
    });

    return PlutoGrid(
      mode: PlutoGridMode.selectWithOneTap,
      columns: gridCols,
      rows: row,
    );
  }
}

class _TrainingTable extends ConsumerWidget {
  const _TrainingTable({super.key, required this.facilities});
  final List facilities;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gridCols = _TrainingInfo.values
        .map((e) => PlutoColumn(
              title: e.label,
              field: e.id,
              type: switch (e.type) {
                "text" => PlutoColumnType.text(),
                "number" => PlutoColumnType.number(),
                "date" => PlutoColumnType.date(),
                _ => PlutoColumnType.text()
              },
            ))
        .toList();
    var mappedInfo = [];
    for (var i = 0; i < facilities.length; i++) {
      var e = facilities[i];
      for (var i = 0; i < (e['trainings'] as List).length; i++) {
        final trainInfo = e['trainings'][i];
        mappedInfo.add({
          "sn": i + 1,
          "facility": e['name'] ?? "",
          "status": trainInfo['status'] ?? "",
          "type": trainInfo['type'] ?? "",
          "date": trainInfo['date'] ?? ""
        });
      }
    }
    final row = List.generate(mappedInfo.length, (index) {
      return PlutoRow(
          cells: _TrainingInfo.values.fold({}, (previousValue, element) {
        dynamic text = mappedInfo[index][element.id];
        return {...previousValue, element.id: PlutoCell(value: text)};
      }));
    });

    return PlutoGrid(
      mode: PlutoGridMode.selectWithOneTap,
      columns: gridCols,
      rows: row,
    );
  }
}
