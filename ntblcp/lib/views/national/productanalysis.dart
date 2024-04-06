import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/views/shared/location_view.dart';

class ProductAnalysisView extends ConsumerWidget {
  const ProductAnalysisView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            DropdownButtonFormField(
                items: [
                  ...Zones.values
                      .map((e) => DropdownMenuItem(
                          value: Zones.values.indexOf(e), child: Text(e.label)))
                      .toList()
                    ..add(DropdownMenuItem(
                      child: Text("all"),
                      value: -1,
                    ))
                ],
                onChanged: (selectedZone) {
                  if (selectedZone != null) {
                    ref.watch(_selectedZone.notifier).state = selectedZone;
                    if (selectedZone == -1) {
                      //make others to be null
                      ref.watch(_selectedState.notifier).state = null;
                      ref.watch(_selectedLga.notifier).state = null;
                    }
                  }
                })
          ],
        ),
        body: SafeArea(child: Placeholder()));
  }
}

final _selectedZone = StateProvider<int?>((ref) => null);
final _selectedState = StateProvider<int?>((ref) => null);
final _selectedLga = StateProvider<int?>((ref) => null);
