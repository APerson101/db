import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ntblcp/views/facility/new_product_usage.dart';
import 'package:ntblcp/views/shared/rtformview.dart';

import '../views/shared/pendingsupplies.dart';

class FacilityButtons extends ConsumerWidget {
  const FacilityButtons(
      {super.key, required this.inventoryId, required this.facilityId});
  final String inventoryId;
  final String facilityId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(children: [
      ..._supplyIcons.values.map((e) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: badges.Badge(
            badgeContent: const Text("3"),
            showBadge: e == _supplyIcons.incoming,
            child: SizedBox(
              height: 100,
              width: 200,
              child: ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return e == _supplyIcons.usage
                          ? NewProductUsage()
                          : e == _supplyIcons.rtForm
                              ? TranferReturnForm(
                                  designation: DesignationEnum.HEAD_FACILITY,
                                  inventoryId: inventoryId,
                                  facilityId: facilityId,
                                )
                              : PendingSupplies(
                                  isReceiver: e == _supplyIcons.incoming,
                                  items: [],
                                  facilityId: facilityId,
                                  inventoryID: inventoryId,
                                );
                    }));
                  },
                  tileColor: Colors.grey,
                  leading: e.icon,
                  title: Text(e.label)),
            ),
          ),
        );
      })
    ]);
  }
}

enum _supplyIcons {
  incoming(label: "Incoming Supply", icon: Icon(Icons.call_received)),
  outgoing(label: "Sent Supply", icon: Icon(Icons.call_made)),
  rtForm(label: "Sent Supplies", icon: Icon(Icons.transfer_within_a_station)),
  usage(label: "New Product usage", icon: Icon(Icons.medical_information));

  const _supplyIcons({required this.icon, required this.label});
  final String label;
  final Icon icon;
}
