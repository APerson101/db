import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/views/shared/inventoryview.dart';
import 'package:ntblcp/views/shared/qform.dart';

class LocationView extends ConsumerWidget {
  const LocationView(
      {super.key,
      required this.currentView,
      required this.locationName,
      required this.nextLocations});
  final LocationEnums currentView;
  final String locationName;
  final List<String> nextLocations;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print({
    //   "here we are with",
    //   view,
    //   "so therefore, next location is",
    //   nextLocations,
    // });
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(locationName),
        ),
        body: Column(children: [
          currentView != LocationEnums.lga
              ? Card(
                  child: ListTile(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return InventoryView(
                            facility: "nationalWarehouseId",
                            inventoryId: "fd",
                          );
                        }));
                      },
                      leading: Icon(Icons.inventory),
                      title: Text("View Warehouse")))
              : Container(),
          Card(
              child: ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Scaffold(appBar: AppBar(), body: QFormView());
                    }));
                  },
                  leading: Icon(Icons.inventory),
                  title: Text("View $locationName Quarterly Report"))),
          currentView != LocationEnums.facility
              ? DropdownButtonFormField(
                  value: ref.watch(_nextLocationProvider),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  hint: Text("Select location to view"),
                  items: nextLocations
                      .map((e) => DropdownMenuItem(
                          value: nextLocations.indexOf(e), child: Text(e)))
                      .toList(),
                  onChanged: (selected) {
                    if (selected != null) {
                      ref.watch(_nextLocationProvider.notifier).state =
                          selected;
                    }
                  })
              : Container(),
          currentView != LocationEnums.facility
              ? ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      var nextView = switch (currentView) {
                        LocationEnums.national => LocationEnums.zone,
                        LocationEnums.zone => LocationEnums.state,
                        LocationEnums.state => LocationEnums.lga,
                        LocationEnums.lga => LocationEnums.facility,
                        _ => LocationEnums.national
                      };
                      var loadnextLocationsOptions = switch (nextView) {
                        LocationEnums.national =>
                          Zones.values.map((e) => e.label).toList(),
                        LocationEnums.zone =>
                          States.values.map((e) => e.name).toList(),
                        LocationEnums.state =>
                          Lga.values.map((e) => e.name).toList(),
                        LocationEnums.lga =>
                          Facility.values.map((e) => e.name).toList(),
                        _ => States.values.map((e) => e.name).toList()
                      };
                      return LocationView(
                          currentView: nextView,
                          locationName: nextLocations[
                              ref.watch(_nextLocationProvider) ?? 0],
                          nextLocations: loadnextLocationsOptions);
                    }));
                    ref.invalidate(_nextLocationProvider);
                  },
                  child: const Text("NEXT"))
              : Container()
        ]));
  }
}

final _nextLocationProvider = StateProvider.autoDispose<int?>((ref) => null);
// location: states
// state select drop down
// next button

//view state inventory
//view state stock card
// view state queriesform
// view state quarterly report
// location: zones
// zones select drop down
// next button

//view state inventory
//view state stock card
// view state queriesform
// view state quarterly report
// location:state
// state select drop down
// next button

//view state inventory
//view state stock card
// view state queriesform
// view state quarterly report
// location: lga
// lga select drop down
// next button

//view state inventory
//view state stock card
// view state queriesform
// view state quarterly report
// faclities
// facilities select drop down
// next button

// view inventory
// view stock card
// quarterly view
//

enum LocationEnums { national, zone, state, lga, facility }

enum Zones {
  sw(label: "South West"),
  ss(label: "South South"),
  se(label: "South East"),
  nw(label: "North West"),
  ne(label: "North East"),
  nc(label: "North Central");

  const Zones({required this.label});
  final String label;
}

enum States { ekiti, ondo }

enum Lga { ado, efon, emure, gbonyin }

enum Facility { abuadClinic, eksuth }

enum NationaalHead { nationalWarehouse }
