import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewStockCard extends ConsumerWidget {
  const ViewStockCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(),
        )));
  }
}
