import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/helpers/constants.dart';
import 'package:ntblcp/providers/dataprovider.dart';
import 'package:ntblcp/views/shared/location_view.dart';

class TranferReturnForm extends ConsumerWidget {
  TranferReturnForm(
      {super.key,
      required this.designation,
      required this.inventoryId,
      required this.facilityId});
  final String inventoryId;
  final numberController = TextEditingController();
  final DesignationEnum designation;
  final String facilityId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
                onPressed: () async {
                  // ref.watch(provider)
                  final products = ref.watch(listOfFormsProvider);
                  ref.watch(
                      sendProductsProvider("NC/SW/WH/1", facilityId, products));
                },
                child: const Text("Send supplies")),
            // select form type
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: SizedBox(
                width: 200,
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    value: ref.watch(_formTypeProvider),
                    items: const [
                      DropdownMenuItem(value: 0, child: Text("Transfer")),
                      DropdownMenuItem(value: 1, child: Text("Return")),
                      DropdownMenuItem(value: 2, child: Text("New supply")),
                    ],
                    onChanged: (selected) {
                      if (selected != null) {
                        ref.watch(_formTypeProvider.notifier).state = selected;
                        ref.watch(_receiverProvider.notifier).state = null;
                      }
                    }),
              ),
            ),
            // select receiver
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: SizedBox(
                width: 250,
                height: 60,
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    hint: const Text("select receiver"),
                    value: ref.watch(_receiverProvider),
                    items: [
                      ...getReceivers(designation, ref)
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              )),
                    ],
                    onChanged: (selected) {
                      if (selected != null) {
                        ref.watch(_receiverProvider.notifier).state = selected;
                      }
                    }),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    ref.watch(_numberOFItemProvider.notifier).update((state) {
                      state += 1;
                      numberController.text = state.toString();
                      return state;
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
                SizedBox(
                    width: 50,
                    height: 40,
                    child: TextFormField(
                      controller: numberController,
                      onChanged: (amount) {
                        if (int.tryParse(amount) != null) {
                          if (int.parse(amount) > 0) {
                            ref.watch(_numberOFItemProvider.notifier).state =
                                int.parse(amount);
                          }
                        } else {
                          numberController.clear();
                          NotificationService.showNotificationToast(
                              context,
                              "invalid input",
                              "Invalid entry",
                              NotificationTypes.error);
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "0",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    )),
                IconButton(
                  onPressed: () {
                    ref.watch(_numberOFItemProvider.notifier).update((state) {
                      state -= 1;
                      if (state < 0) {
                        numberController.text = 0.toString();

                        return 0;
                      }
                      numberController.text = state.toString();
                      return state;
                    });
                  },
                  icon: const Icon(Icons.remove),
                )
              ],
            )
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            const Row(children: [
              SizedBox(width: 60),
              Text("s/n"),
              SizedBox(width: 150),
              Text("product"),
              SizedBox(width: 150),
              Text("batch"),
              SizedBox(width: 150),
              Text("Quantity"),
              SizedBox(width: 150),
              Text("Remarks")
            ]),
            ...List.generate(ref.watch(_numberOFItemProvider), (index) {
              var current;
              try {
                current = ref.watch(listOfFormsProvider)[index];
              } catch (_) {
                current = {};
              }
              return GestureDetector(
                onTap: () {
                  ref.watch(_currentViewProvider.notifier).state = index;
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (Context) {
                    return _RTView(
                      currentForm: index,
                      designation: designation,
                      inventoryId: inventoryId,
                    );
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          const SizedBox(width: 60),
                          Text((index + 1).toString()),
                          const SizedBox(width: 150),
                          Text(current?["productName"].toString() ?? "-"),
                          const SizedBox(width: 150),
                          Text(current?["batch"].toString() ?? "-"),
                          const SizedBox(width: 150),
                          Text(current?["quantity"].toString() ?? "-"),
                          const SizedBox(width: 150),
                          Text(current?["remarks"].toString() ?? "-"),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })
          ],
        ))));
  }
}

final _numberOFItemProvider = StateProvider((ref) => 0);

class _RTView extends ConsumerWidget {
  _RTView(
      {required this.currentForm,
      required this.designation,
      required this.inventoryId});
  final nodes = List.generate(6, (index) => FocusNode());
  final quantityController = TextEditingController();
  final remarksController = TextEditingController();
  final int currentForm;
  final DesignationEnum designation;
  final String inventoryId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, dynamic> currentFormData;
    try {
      currentFormData =
          ref.watch(listOfFormsProvider)[ref.watch(_currentViewProvider)];
    } catch (e) {
      currentFormData = {};
    }

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
          int batchQuantity = 0;
          try {
            final b = map.entries.toList()[ref.watch(_productProvider)].value;
            var batchOfInterest =
                b.firstWhere((e) => e['batch'] == ref.watch(_selectedBatch));
            batchQuantity = batchOfInterest['quantity'] ?? 0;

            int currentUsed = ref
                .watch(listOfFormsProvider)
                .where(
                    (element) => element['batch'] == ref.watch(_selectedBatch))
                .map((e) => e['quantity'])
                .reduce((value, element) => value + element);
            batchQuantity = batchQuantity - currentUsed;
          } catch (_) {}

          return Scaffold(
              appBar: AppBar(
                actions: [
                  TextButton(
                      onPressed: () async {
                        ref
                            .watch(_currentViewProvider.notifier)
                            .update((state) {
                          state += 1;
                          return state;
                        });
                      },
                      child: const Text("Next")),
                  TextButton(
                      onPressed: () async {
                        ref
                            .watch(_currentViewProvider.notifier)
                            .update((state) {
                          state -= 1;
                          return state;
                        });
                        ref.watch(listOfFormsProvider.notifier).update((state) {
                          state.remove(state.last);
                          state = [...state];
                          return state;
                        });
                      },
                      child: const Text("Previous")),
                ],
              ),
              body: SingleChildScrollView(
                  child: Column(
                children: [
                  DropdownButtonFormField(
                      focusNode: nodes[0],
                      hint: const Text("Select product"),
                      value: currentFormData["productId"] ??
                          ref.watch(_productProvider),
                      items: [
                        ...map.keys.map((e) => DropdownMenuItem(
                            value: map.keys.toList().indexOf(e),
                            child: Text(e)))
                      ],
                      onChanged: (selected) {
                        if (selected != null) {
                          currentFormData["productId"] = null;
                          ref.watch(_productProvider.notifier).state =
                              selected as int;
                          nodes[1].requestFocus();
                        }
                      }),
                  DropdownButtonFormField(
                      value: currentFormData['batch'] != null
                          ? currentFormData['batch'].toString()
                          : ref.watch(_selectedBatch),
                      decoration: InputDecoration(
                          label: const Text("Select batch no"),
                          hintText: "Select batch no",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      items: [
                        ...map.entries
                            .toList()[ref.watch(_productProvider)]
                            .value
                            .map((e) {
                          return DropdownMenuItem(
                            value: e['batch'] as String,
                            child: Text(e['batch']),
                          );
                        })
                      ],
                      onChanged: (batch) {
                        if (batch != null) {
                          ref.watch(_selectedBatch.notifier).state = batch;
                        }
                      }),
                  TextFormField(
                      textInputAction: TextInputAction.done,
                      controller: quantityController
                        ..text = currentFormData['quantity'] != null
                            ? currentFormData['quantity'].toString()
                            : ref.watch(_quantityProvider) != null
                                ? ref.watch(_quantityProvider).toString()
                                : "",
                      focusNode: nodes[1],
                      onFieldSubmitted: (quantity) {
                        nodes[2].requestFocus();
                      },
                      onChanged: (quantity) {
                        if (int.tryParse(quantity) == null &&
                            quantity.isNotEmpty) {
                          quantityController.text = "";
                          NotificationService.showNotificationToast(
                              context,
                              "Invalid text, enter numbers only",
                              "Error",
                              NotificationTypes.error);
                        }
                        if (int.tryParse(quantity) != null) {
                          ref.watch(_quantityProvider.notifier).state =
                              int.parse(quantity);
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Quantity",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  ref.watch(_selectedBatch) != null
                      ? ListTile(
                          title: Text("current quantity: $batchQuantity"))
                      : Container(),
                  ref.watch(_quantityProvider) != null
                      ? ListTile(
                          title: Text(
                              "New quantity: ${batchQuantity - (ref.watch(_quantityProvider) ?? 0)}"))
                      : Container(),
                  TextFormField(
                      controller: remarksController
                        ..text = currentFormData["remarks"] ?? "",
                      focusNode: nodes[2],
                      onSaved: (quantity) {
                        nodes[5].requestFocus();
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Remarks",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  ElevatedButton(
                      focusNode: nodes[3],
                      onPressed: () async {
                        int currentTotal = ref.watch(_quantityProvider) ?? 0;

                        try {
                          currentTotal = ref
                                  .watch(listOfFormsProvider)
                                  .where((element) =>
                                      element['productId'] ==
                                      ref.watch(_productProvider))
                                  .map((e) => e['quantity'])
                                  .reduce((value, element) => value + element) +
                              ref.watch(_quantityProvider);
                        } catch (_) {}
                        ref.watch(listOfFormsProvider.notifier).update((state) {
                          try {
                            state[ref.watch(_currentViewProvider)] = {
                              "productId": ref.watch(_productProvider),
                              "productName": map.keys
                                  .toList()[ref.watch(_productProvider)],
                              "pid": map.entries
                                  .firstWhere((element) =>
                                      element.key ==
                                      map.keys.toList()[
                                          ref.watch(_productProvider)])
                                  .value[0]["id"],
                              "batch": ref.watch(_selectedBatch),
                              "quantity": ref.watch(_quantityProvider),
                              "expiryDate": map[map.keys
                                      .toList()[ref.watch(_productProvider)]]!
                                  .firstWhere((element) =>
                                      element['batch'] ==
                                      ref.watch(_selectedBatch))['expiry'],
                              "remarks": remarksController.text,
                              "itemQuantityId": map[map.keys
                                      .toList()[ref.watch(_productProvider)]]!
                                  .firstWhere((element) =>
                                      element['batch'] ==
                                      ref.watch(_selectedBatch))['pquantityId'],
                              "newQuantity": batchQuantity -
                                  (ref.watch(_quantityProvider) ?? 0),
                              "stockBalance": map[map.keys.toList()[
                                          ref.watch(_productProvider)]]!
                                      .map((e) => e['quantity'])
                                      .reduce(
                                          (value, element) => value + element) -
                                  currentTotal,
                            };
                          } catch (_) {
                            state.add({
                              "productId": ref.watch(_productProvider),
                              "productName": map.keys
                                  .toList()[ref.watch(_productProvider)],
                              "pid": map.entries
                                  .firstWhere((element) =>
                                      element.key ==
                                      map.keys.toList()[
                                          ref.watch(_productProvider)])
                                  .value[0]["id"],
                              "batch": ref.watch(_selectedBatch),
                              "quantity": ref.watch(_quantityProvider),
                              "expiryDate": map[map.keys
                                      .toList()[ref.watch(_productProvider)]]!
                                  .firstWhere((element) =>
                                      element['batch'] ==
                                      ref.watch(_selectedBatch))['expiry'],
                              "remarks": remarksController.text,
                              "itemQuantityId": map[map.keys
                                      .toList()[ref.watch(_productProvider)]]!
                                  .firstWhere((element) =>
                                      element['batch'] ==
                                      ref.watch(_selectedBatch))['pquantityId'],
                              "newQuantity": batchQuantity -
                                  (ref.watch(_quantityProvider) ?? 0),
                              "stockBalance": map[map.keys.toList()[
                                          ref.watch(_productProvider)]]!
                                      .map((e) => e['quantity'])
                                      .reduce(
                                          (value, element) => value + element) -
                                  currentTotal
                            });
                          }
                          state = [...state];
                          return state;
                        });
                        nodes[0].requestFocus();
                        ref.invalidate(_productProvider);
                        ref.invalidate(_quantityProvider);
                        ref.invalidate(_selectedBatch);
                        remarksController.clear();
                        quantityController.clear();

                        if (ref.watch(_numberOFItemProvider) ==
                            (ref.watch(_currentViewProvider) + 1)) {
                          Navigator.of(context).pop();
                        }

                        ref
                            .watch(_currentViewProvider.notifier)
                            .update((state) {
                          if (state + 1 == ref.watch(_numberOFItemProvider)) {
                            state = 0;
                          } else {
                            state += 1;
                          }
                          return state;
                        });
                      },
                      child: Text(ref.watch(_numberOFItemProvider) ==
                              (ref.watch(_currentViewProvider) + 1)
                          ? "Save"
                          : "Next"))
                ],
              )));
        },
        error: (er, s) {
          debugPrintStack(stackTrace: s);
          return const Center(child: Text("error, failed to load"));
        },
        loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ));
  }
}

final _formTypeProvider = StateProvider.autoDispose((ref) => 0);
final _receiverProvider = StateProvider.autoDispose<String?>((ref) => null);
final _productProvider = StateProvider.autoDispose((ref) => 0);
final listOfFormsProvider =
    StateProvider<List<Map<String, dynamic>>>((ref) => []);
final _currentViewProvider = StateProvider((ref) => 0);
final _selectedBatch = StateProvider<String?>((ref) => null);
final _quantityProvider = StateProvider<int?>((ref) => null);

List<String> getReceivers(DesignationEnum designation, WidgetRef ref) {
  if (ref.watch(_formTypeProvider) == 2) {
    var loadnextLocationsOptions = switch (designation) {
      DesignationEnum.HEAD_NATION => Zones.values.map((e) => e.label).toList(),
      DesignationEnum.HEAD_ZONE => States.values.map((e) => e.name).toList(),
      DesignationEnum.HEAD_STATE => Lga.values.map((e) => e.name).toList(),
      DesignationEnum.HEAD_LGA => Facility.values.map((e) => e.name).toList(),
      _ => States.values.map((e) => e.name).toList()
    };
    return loadnextLocationsOptions;
  }

  if (ref.watch(_formTypeProvider) == 0) // transfer
  {
    var loadnextLocationsOptions = switch (designation) {
      DesignationEnum.HEAD_ZONE => Zones.values.map((e) => e.label).toList(),
      DesignationEnum.HEAD_STATE => States.values.map((e) => e.name).toList(),
      DesignationEnum.HEAD_LGA => Lga.values.map((e) => e.name).toList(),
      DesignationEnum.HEAD_FACILITY =>
        Facility.values.map((e) => e.name).toList(),
      _ => States.values.map((e) => e.name).toList()
    };
    return loadnextLocationsOptions;
  }

  if (ref.watch(_formTypeProvider) == 1)
  //return
  {
    var loadnextLocationsOptions = switch (designation) {
      DesignationEnum.HEAD_ZONE =>
        NationaalHead.values.map((e) => e.name).toList(),
      DesignationEnum.HEAD_STATE => ['South West Warehouse'],
      DesignationEnum.HEAD_LGA => ['Ekiti Warehouse'],
      DesignationEnum.HEAD_FACILITY => ['Ado waehouse'],
      _ => States.values.map((e) => e.name).toList()
    };
    return loadnextLocationsOptions;
  }

  return [];
}

enum DesignationEnum {
  HEAD_NATION,
  HEAD_ZONE,
  HEAD_STATE,
  HEAD_LGA,
  HEAD_FACILITY
}
