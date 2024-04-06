import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/helpers/constants.dart';

class NewProductUsage extends ConsumerWidget {
  NewProductUsage({super.key});
  final List<FocusNode> nodes = List.generate(3, (index) => FocusNode());
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        FocusScope.of(context).requestFocus(nodes[ref.watch(_currentNode)]));
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Column(
          children: [
            TextField(
              controller: quantityController,
              focusNode: nodes[0],
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onChanged: (quantity) {
                if ((int.tryParse(quantity) == null ||
                        quantity.contains(".")) &&
                    quantity.isNotEmpty) {
                  quantityController.clear();
                  NotificationService.showNotificationToast(
                      context,
                      "Invalid Entry",
                      "must be a number only",
                      NotificationTypes.error);
                }
              },
              onSubmitted: (quantity) {
                ref.watch(_currentNode.notifier).state = 1;
                // nodes[1].requestFocus();
              },
              decoration: InputDecoration(
                  hintText: "Enter quantity used",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            TextField(
              controller: nameController,
              focusNode: nodes[1],
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              onChanged: (name) {
                if ((name.contains(RegExp(r'0-9'))) && name.isNotEmpty) {
                  nameController.clear();
                  NotificationService.showNotificationToast(
                      context,
                      "Invalid Entry",
                      "must be a name only",
                      NotificationTypes.error);
                }
              },
              onSubmitted: (quantity) {
                ref.watch(_currentNode.notifier).state = 2;
              },
              decoration: InputDecoration(
                  hintText: "Enter receiver Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            ElevatedButton(
                focusNode: nodes[2],
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Confirmation"),
                          content: Text("Confirm usage of product"),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("YES")),
                            TextButton(
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("NO"))
                          ],
                        );
                      });
                },
                child: const Text("Confirm"))
          ],
        )));
  }
}

final _currentNode = StateProvider<int>((ref) => 0);
