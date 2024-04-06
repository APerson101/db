import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/providers/dataprovider.dart';

import 'location_view.dart';

class SendSupplies extends ConsumerWidget {
  SendSupplies({super.key, required this.inventoryId});
  final String inventoryId;
  final qController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getInventoryProvider(inventoryId)).when(
        data: (data) {
          return Scaffold(
              appBar: AppBar(
                actions: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            ref
                                .watch(_quantity.notifier)
                                .update((state) => (state ?? 0) + 1);
                          },
                          icon: Icon(Icons.add)),
                      SizedBox(
                        height: 30,
                        width: 50,
                        child: TextFormField(
                          controller: qController,
                          onChanged: (qu) {
                            if (int.tryParse(qu) == null) {
                              qController.clear();
                              return;
                            } else {
                              ref.watch(_quantity.notifier).state =
                                  int.parse(qu);
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "0",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            ref
                                .watch(_quantity.notifier)
                                .update((state) => (state ?? 0) - 1);
                          },
                          icon: Icon(Icons.remove)),
                    ],
                  ),
                  DropdownButtonFormField(
                    items: [],
                    onChanged: (selected) {},
                    decoration: InputDecoration(
                        hintText: "Select Receiver",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  )
                ],
              ),
              body: SafeArea(child: Placeholder()));
        },
        error: (er, st) {
          debugPrintStack(stackTrace: st);
          return Center(
            child: Text("error"),
          );
        },
        loading: () => Center(
              child: CircularProgressIndicator.adaptive(),
            ));
  }
}

final _quantity = StateProvider<int?>((ref) => null);
