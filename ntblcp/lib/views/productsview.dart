import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsView extends ConsumerWidget {
  const ProductsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(appBar: AppBar(), body: SafeArea(child: Container()));
  }
}
