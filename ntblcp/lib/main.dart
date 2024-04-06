import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntblcp/providers/getters.dart';
import 'package:ntblcp/views/authview.dart';
import 'package:ntblcp/views/dashboard.dart';
import 'package:ntblcp/views/lga/tbform.dart';
import 'package:ntblcp/views/productsview.dart';
import 'package:ntblcp/views/shared/facilitiesdataview.dart';
import 'package:ntblcp/views/shared/inventoryview.dart';
import 'package:ntblcp/views/shared/location_view.dart';
import 'package:ntblcp/views/shared/qform.dart';
import 'package:ntblcp/views/shared/queryview.dart';
import 'package:ntblcp/views/shared/rtformview.dart';
import 'package:ntblcp/views/sidemenu.dart';

import 'providers/dataprovider.dart';

void main() {
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(configureProvider).when(
        error: (er, st) => const Center(
              child: Text("Failed to load"),
            ),
        loading: () => const Material(
              child: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
        data: (_) {
          return MaterialApp(
              debugShowCheckedModeBanner: false, home: AuthView());
        });
  }
}

// class _testButtons extends ConsumerWidget {
//   const _testButtons({super.key});
//   final facilityId = "SW/EK/ADO/FC/ABUAD/1";
//   final userId = "SW/EK/ADO/HF/ABUAD/1";
//   final microId = "SW/EK/ADO/MS/ABUAD/1";
//   final warehouseId = "NC/FC/1";
//   final nationalUserId = "NC/WH/1";
//   final facilityInvetoryId = "asfhdsa87fsjkaf";
//   final warehouseInventoryId = "83kjsdhgfkjashf789";
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//       ElevatedButton(
//           onPressed: () async {
//             final status =
//                 await ref.watch(createUserProvider(false, '${userId}4').future);
//             debugPrint(status.toString());
//           },
//           child: const Text("Create user")),
//       ElevatedButton(
//           onPressed: () async {
//             final status =
//                 await ref.watch(createUserProvider(true, microId).future);
//             debugPrint(status.toString());
//           },
//           child: const Text("Create Microscopist user")),
//       ElevatedButton(
//           onPressed: () async {
//             await ref.watch(
//                 createFacilityProvider('${facilityId}4', facilityInvetoryId)
//                     .future);
//           },
//           child: const Text("Create Facility")),
//       ElevatedButton(
//           onPressed: () async {
//             final users = await ref.watch(assignUserToFacilityProvider(
//                     '${facilityId}4', '${userId}4', false)
//                 .future);
//             print(users);
//           },
//           child: const Text("Assign user and Facility")),
//       ElevatedButton(
//           onPressed: () async {
//             final users = await ref.watch(
//                 assignUserToFacilityProvider(facilityId, microId, true).future);
//             print(users);
//           },
//           child: const Text("Assign micro user and Facility")),
//       ElevatedButton(
//           onPressed: () async {
//             final users =
//                 await ref.watch(createStaffTrainingProvider(microId).future);
//             print(users);
//           },
//           child: const Text("Create Staff Training")),
//       ElevatedButton(
//           onPressed: () async {
//             final users = await ref
//                 .watch(createFacilityTrainingProvider(facilityId).future);
//             print(users);
//           },
//           child: const Text("create Training for  Facility")),
//       ElevatedButton(
//           onPressed: () async {
//             await ref.watch(getFacilitiesProvider.future);
//           },
//           child: const Text("Get Some Facilites")),
//       ElevatedButton(
//           onPressed: () async {
//             await ref.watch(getAllFacilitiesProvider.future);
//           },
//           child: const Text("Get All Facilites")),
//       ElevatedButton(
//           onPressed: () async {
//             await ref.watch(getUsersProvider.future);
//           },
//           child: const Text("Get Users")),
//       ElevatedButton(
//           onPressed: () async {
//             await ref.watch(getInventoryProvider(facilityInvetoryId).future);
//           },
//           child: const Text("Get Inventory")),
//       ElevatedButton(
//           onPressed: () async {
//             for (var i = 0; i < 3; i++) {
//               final newProduct = {
//                 "name": "product name $i",
//                 "description": "Product description for $i",
//                 "id": i.toString()
//               };
//               await ref.watch(createNewProductProvider(newProduct).future);
//             }
//           },
//           child: const Text("Create 3 new Products")),
//       ElevatedButton(
//           onPressed: () async {
//             final warehouse = {
//               'id': warehouseId,
//               'type': "WAREHOUSE",
//               'name': "Nigeria National Warehouse",
//               'address': "Lagos HQ",
//               "inventoryId": warehouseInventoryId
//             };
//             await ref.watch(createNationalFacilityProvider(warehouse).future);
//           },
//           child: const Text("Create National Warehouse")),
//       ElevatedButton(
//           onPressed: () async {
//             final user = {
//               'id': nationalUserId,
//               'name': "National user",
//               'email': "national@gmail.com",
//               'designation': "HEAD_WAREHOUSE",
//               'primaryNumber': "1987654321",
//               'secondaryNumber': "01234567891",
//             };
//             await ref.watch(createNationalUserProvider(user).future);
//           },
//           child: const Text("Create National Warehouse Contact")),
//       ElevatedButton(
//           onPressed: () async {
//             await ref.watch(assignNationalUserToFacilityProvider({
//               "facilityId": warehouseId,
//               "userId": nationalUserId,
//             }).future);
//           },
//           child: const Text("Assign national user and Facility")),
//       ElevatedButton(
//           onPressed: () async {
//             List newStock = [];

//             for (var i = 0; i < 3; i++) {
//               newStock.add({
//                 "productBatchProductId": i.toString(),
//                 "batch": "batch $i",
//                 "quantity": 20,
//                 "expiryDate": "2024-11-11",
//                 "date": "2024-03-25",
//                 "lossesAdjustements": 0,
//                 "stockBalance": 20,
//               });
//             }
//             await ref.watch(addProductsToNationalInventoryProvider(
//                     warehouseId, newStock, warehouseInventoryId)
//                 .future);
//           },
//           child: const Text("Add to National Warehouse")),
//       ElevatedButton(
//           onPressed: () async {
//             await ref.watch(getInventoryProvider(warehouseId).future);
//           },
//           child: const Text("Get inventory")),
//       ElevatedButton(
//           onPressed: () async {
//             await ref.watch(testerProvider.future);
//           },
//           child: const Text("TEST")),
//       ElevatedButton(
//           onPressed: () async {
//             final supplyId = uuid();
//             final supply = {
//               "id": supplyId,
//               "supplySenderId": warehouseId,
//               "supplyReceiverId": facilityId,
//               "type": "DELIVERY",
//               "sendDate": TemporalDate.now().format(),
//               "status": "SENT",
//             };

//             // add to stock card

//             final stockCard = {
//               "stockCardProductId": "1",
//               "facilityStockCardId": warehouseId,
//               "receiver": facilityId,
//               "date": TemporalDate.now().format(),
//               "quantityIssued": 3,
//               "stockBalance": 17,
//               "lossesAdjustements": 0,
//               "batchNo": "batch 1",
//               "expiryDate": "2024-11-11",
//             };
//             List productsBatches = [];
//             for (var i = 0; i < 3; i++) {
//               final pBatch = {
//                 'batch': "batch $i",
//                 'quantity': "3",
//                 "productBatchProductId": "$i",
//                 'expiryDate': TemporalDate.now().format(),
//               };
//               pBatch.addAll(pBatch);
//             }
//             await ref.watch(createSupplyProvider({
//               "supply": supply,
//               "productBatches": productsBatches,
//               "stockCard": stockCard,
//               "inventoryId": warehouseInventoryId
//             }).future);
//           },
//           child: const Text("Send to Facilty")),
//     ]);
//   }
// }

class MainContent extends ConsumerWidget {
  const MainContent({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final curr = ref.watch(selectedViewProvider);
    return Scaffold(
        body: ref.watch(getUserProvider(email)).when(
            data: (user) {
              return Stack(children: [
                Positioned(
                    left: 10,
                    top: 10,
                    bottom: 10,
                    width: MediaQuery.of(context).size.width * .2,
                    child: SideMenu(profile: user)),
                Positioned(
                    left: MediaQuery.of(context).size.width * .21,
                    top: 10,
                    bottom: 10,
                    right: 0,
                    child: curr == SideMenuItems.dashboard
                        ? DashboardView(user: user)
                        : curr == SideMenuItems.inventory
                            ? InventoryView(
                                facility: user['userFacilityId'],
                                inventoryId: user['facility']
                                    ['inventorySummary']['id'])
                            : curr == SideMenuItems.analyis
                                ? const ProductsView()
                                : QFormView())
              ]);
            },
            error: (er, st) {
              debugPrintStack(stackTrace: st);
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 87,
                    ),
                    Text("Failed to fetch user"),
                    SizedBox(
                      height: 87,
                    ),
                    IconButton(
                        onPressed: () {
                          ref.invalidate(getUserProvider(email));
                        },
                        icon: const Icon(Icons.refresh))
                  ],
                ),
              );
            },
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive())));
  }
}
