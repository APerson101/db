import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/providers/dataprovider.dart';
import 'package:ntblcp/views/zone/zonalbuttons.dart';
import 'package:ntblcp/widgets/lgabuttons.dart';
import 'package:ntblcp/widgets/facilitybuttons.dart';
import 'package:ntblcp/widgets/nationalbuttons.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key, required this.user});
  final Map<String, dynamic> user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final view = switch (user["designation"]) {
      "HEAD_FACILITY" => _HeadFacilityView(user: user),
      // "HEAD_STATE" => _StateView(),
      "HEAD_ZONE" => _ZoneView(user: user),
      "HEAD_NATION" => _NationalView(
          user: user,
        ),
      "HEAD_LGA" => _LgaView(lga: user["lga"], userId: user['id']),
      _ => const _ErrorView(),
    };
    return view;
  }
}

// pending deliveries, statistics summaries
// head of facility:
// button to register new supply consumption
// transfer/emergency request
//view inventory

class _ZoneView extends ConsumerWidget {
  const _ZoneView({super.key, required this.user});
  final dynamic user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ZonalButtons(
              inventoryId: user['facility']['inventorySummary']['id'],
              facilityId: user['userFacilityId'],
            )),
        // Positioned(
        //     bottom: 10,
        //     left: 10,
        //     right: 10,
        //     height: MediaQuery.of(context).size.height * .5,
        //     child: Placeholder())
      ],
    );
  }
}

class _HeadFacilityView extends ConsumerWidget {
  const _HeadFacilityView({super.key, required this.user});
  final dynamic user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: FacilityButtons(
              inventoryId: user['facility']['inventorySummary']['id'],
              facilityId: user['userFacilityId'],
            )),
        // Positioned(
        //     bottom: 10,
        //     left: 10,
        //     right: 10,
        //     height: MediaQuery.of(context).size.height * .5,
        //     child: Placeholder())
      ],
    );
  }
}

class _ErrorView extends ConsumerWidget {
  const _ErrorView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Column(
          children: [
            Text("Unknown view"),
            IconButton(
                onPressed: () {
                  ref.invalidate(getUsersProvider);
                },
                icon: Icon(Icons.refresh))
          ],
        )));
  }
}

class _LgaView extends ConsumerWidget {
  const _LgaView({super.key, required this.lga, required this.userId});
  final String lga;
  final String userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LGAButtons(
              lga: lga,
              userId: userId,
            )),
        // Positioned(
        //     bottom: 10,
        //     left: 10,
        //     right: 10,
        //     height: MediaQuery.of(context).size.height * .5,
        //     child: Placeholder())
      ],
    );
  }
}

class _NationalView extends ConsumerWidget {
  const _NationalView({super.key, required this.user});
  final Map<String, dynamic> user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NationalButtons(
              nationalInvId: user['facility']['inventorySummary']['id'],
              facilityId: user['userFacilityId'],
            )),
        // Positioned(
        //     bottom: 10,
        //     left: 10,
        //     right: 10,
        //     height: MediaQuery.of(context).size.height * .5,
        //     child: Placeholder())
      ],
    );
  }
}
