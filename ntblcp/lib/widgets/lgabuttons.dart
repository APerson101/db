import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/views/lga/tbform.dart';
import 'package:ntblcp/views/shared/facilitiesdataview.dart';
import 'package:ntblcp/views/shared/qform.dart';
import 'package:ntblcp/views/shared/queryview.dart';

class LGAButtons extends ConsumerWidget {
  const LGAButtons({super.key, required this.lga, required this.userId});
  final String lga;
  final String userId;
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
                  return TBFormEntry(lga: lga);
                }));
              },
              leading: const Icon(Icons.plus_one),
              title: const Text("Record TB cases"),
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
                      return FacilitiesDataView(
                        location: '{lga:"$lga"}',
                      );
                    }));
                  },
                  leading: const Icon(Icons.warehouse_sharp),
                  title: Text("View $lga Facilities"),
                ))),
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
                      return Scaffold(appBar: AppBar(), body: QFormView());
                    }));
                  },
                  leading: const Icon(Icons.warehouse_sharp),
                  title: const Text("LGA Report"),
                ))),
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
                      return QueriesView();
                    }));
                  },
                  leading: const Icon(Icons.difference),
                  title: const Text("Discrepancy Report"),
                ))),
      ],
    );
  }
}
