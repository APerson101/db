import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/helpers/constants.dart';
import 'package:ntblcp/views/authview.dart';

class SideMenu extends ConsumerWidget {
  const SideMenu({super.key, required this.profile});
  final dynamic profile;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Constants.PrimaryColor,
          borderRadius: BorderRadius.circular(15)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: SizedBox(
            child: ListTile(
              subtitle: Text(profile['designation']),
              title: Text(
                profile['facility']?['name'] ?? "ADO LGA",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const Divider(),
        ...SideMenuItems.values.map((e) {
          final isSelected = ref.watch(selectedViewProvider) == e;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: ListTile(
                  selected: isSelected,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  selectedColor: Colors.white,
                  onTap: () {
                    ref.watch(selectedViewProvider.notifier).state = e;
                  },
                  leading: e.icon,
                  title: Text(e.label,
                      style: TextStyle(
                          color: isSelected ? Colors.green : Colors.white,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal))),
            ),
          );
        }),
        const Spacer(),
        const Divider(),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                return AuthView();
              }), (route) => true);
            },
            child: const Text("Log out",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)))
      ]),
    );
  }
}

enum SideMenuItems {
  dashboard(label: "Dashboard", icon: Icon(Icons.dashboard_outlined)),
  inventory(label: "Inventory", icon: Icon(Icons.card_giftcard)),
  analyis(label: "Analysis", icon: Icon(Icons.auto_graph_outlined)),
  report(label: "Report", icon: Icon(Icons.analytics)),
  forms(label: "Forms", icon: Icon(Icons.format_shapes));

  const SideMenuItems({required this.label, required this.icon});
  final String label;
  final Widget icon;
}

final selectedViewProvider = StateProvider<SideMenuItems>((ref) {
  return SideMenuItems.dashboard;
});
