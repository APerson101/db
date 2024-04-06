import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/providers/dataprovider.dart';
import 'package:ntblcp/views/shared/location_view.dart';
import 'package:ntblcp/views/shared/rtformview.dart';

class NationalButtons extends ConsumerWidget {
  const NationalButtons(
      {super.key, required this.nationalInvId, required this.facilityId});
  final String nationalInvId;
  final String facilityId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            width: 200,
            child: ListTile(
              tileColor: Colors.grey,
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return _InventoryAddition(
                    inventoryId: nationalInvId,
                  );
                }));
              },
              leading: const Icon(Icons.plus_one),
              title: const Text("Add to Inventory"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            width: 200,
            child: ListTile(
              tileColor: Colors.grey,
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return TranferReturnForm(
                      designation: DesignationEnum.HEAD_NATION,
                      inventoryId: nationalInvId,
                      facilityId: facilityId);
                }));
              },
              leading: const Icon(Icons.send),
              title: const Text("Send Supplies"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            width: 200,
            child: ListTile(
              tileColor: Colors.grey,
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return LocationView(
                      currentView: LocationEnums.national,
                      locationName: "National",
                      nextLocations: States.values.map((e) => e.name).toList());
                }));
              },
              leading: const Icon(Icons.send),
              title: const Text("Location View"),
            ),
          ),
        ),
      ],
    );
  }
}

class _InventoryAddition extends ConsumerWidget {
  _InventoryAddition({super.key, required this.inventoryId});
  final qController = TextEditingController();
  final bController = TextEditingController();
  final String inventoryId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getInventoryProvider(inventoryId)).when(data: (inventory) {
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
      int currentTotal = map.entries.first.value
          .map((e) => e["quantity"])
          .reduce((value, element) => value + element);

      return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
              child: Column(
            children: [
              DropdownButtonFormField(
                  value: 0,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  items: const [
                    DropdownMenuItem(
                      child: Text("Patient Kit I"),
                      value: 0,
                    )
                  ],
                  onChanged: (event) {}),
              ListTile(
                title: Text("Current total"),
                subtitle: Text(currentTotal.toString()),
              ),
              TextFormField(
                controller: qController,
                onChanged: (newQuantity) {
                  ref.watch(newBalance.notifier).update((state) {
                    if (state == null) {
                      return int.parse(newQuantity) + currentTotal;
                    } else {
                      return int.parse(newQuantity) + currentTotal;
                    }
                  });
                },
                decoration: InputDecoration(
                    hintText: "Enter quantity received",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              TextFormField(
                controller: bController,
                onChanged: (batch) {
                  if (int.tryParse(batch) == null) {
                    bController.clear();
                  }

                  int? oldQ = map["Patient Kit I"]?.firstWhere(
                      (element) => element['batch'] == batch)['quantity'];
                  int newQ = (oldQ ?? 0) + int.parse(qController.text);
                  ref.watch(selectedBatch.notifier).state = newQ;
                  ref.watch(oldTotal.notifier).state = oldQ;
                },
                decoration: InputDecoration(
                    hintText: "Enter batch no",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              ListTile(
                leading: Text(
                    "Batch #${bController.text} old total is ${ref.watch(oldTotal)},  new total: ${ref.watch(selectedBatch)}"),
              ),
              ListTile(
                  title: const Text("New Balance"),
                  subtitle: Text(
                    (ref.watch(newBalance) ?? 0).toString(),
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  )),
              ListTile(
                  onTap: () async {
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate:
                            DateTime.now().add(const Duration(days: 1000)));
                    if (date != null) {
                      print(date.toIso8601String());
                      ref.watch(eDate.notifier).state = TemporalDate.fromString(
                              date.toIso8601String().split('T')[0])
                          .format();
                    }
                  },
                  title: Text(
                    ref.watch(eDate) ?? "Select Expiry Date",
                  )),
              ElevatedButton(
                  onPressed: () async {
                    await ref.watch(updateInventoryProvider(
                            int.parse(qController.text),
                            ref.watch(eDate)!,
                            bController.text,
                            ref.watch(newBalance) ?? 0)
                        .future);

                    Navigator.of(context).pop();
                  },
                  child: const Text("Add to inventory")),
            ],
          )));
    }, error: (er, st) {
      debugPrintStack(stackTrace: st);
      return Center(
        child: Text("Failed to load"),
      );
    }, loading: () {
      return Center(
        child: CircularProgressIndicator.adaptive(),
      );
    });
  }
}

final eDate = StateProvider<String?>((ref) {
  return null;
});

final newBalance = StateProvider<int?>((ref) => null);
final selectedBatch = StateProvider<int?>((ref) => null);
final oldTotal = StateProvider<int?>((ref) => null);
