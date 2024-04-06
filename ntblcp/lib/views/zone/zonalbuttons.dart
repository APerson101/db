import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ntblcp/providers/dataprovider.dart';
import 'package:ntblcp/views/shared/pendingsupplies.dart';
import 'package:ntblcp/views/shared/rtformview.dart';

class ZonalButtons extends ConsumerWidget {
  const ZonalButtons(
      {super.key, required this.inventoryId, required this.facilityId});
  final String inventoryId;
  final String facilityId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getPendingDeliveryProvider(facilityId)).when(data: (data) {
      print(data);
      return Wrap(children: [
        ..._supplyIcons.values.map((e) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: badges.Badge(
              badgeContent: Text(data.length.toString()),
              showBadge: (e == _supplyIcons.incoming && data.isNotEmpty),
              child: SizedBox(
                height: 100,
                width: 200,
                child: ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return e == _supplyIcons.rtForm
                            ? TranferReturnForm(
                                designation: DesignationEnum.HEAD_FACILITY,
                                inventoryId: inventoryId,
                                facilityId: facilityId,
                              )
                            : PendingSupplies(
                                isReceiver: e == _supplyIcons.incoming,
                                items: data,
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

enum _supplyIcons {
  incoming(label: "Incoming Supply", icon: Icon(Icons.call_received)),
  outgoing(label: "Sent Supply", icon: Icon(Icons.call_made)),
  rtForm(label: "Sent Supplies", icon: Icon(Icons.transfer_within_a_station));

  const _supplyIcons({required this.icon, required this.label});
  final String label;
  final Icon icon;
}
