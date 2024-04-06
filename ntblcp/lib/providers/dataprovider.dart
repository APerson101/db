import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../amplifyconfiguration.dart' as ampconfig;
part "dataprovider.g.dart";

const String baseURL = "fj8ej2p720.execute-api.eu-north-1.amazonaws.com";
@riverpod
Future<void> getFacilities(GetFacilitiesRef ref) async {
  var url = Uri.https(baseURL, 'prod/getAllFacilities', {'region': "sw"});
  await http.get(url);
}

@riverpod
Future<bool> createNationalFacility(
    CreateNationalFacilityRef ref, Map<String, dynamic> facility) async {
  var url = Uri.https(baseURL, 'prod/createFacility');
  await http.post(url, body: jsonEncode(facility));
  return true;
}

@riverpod
Future<bool> createFacility(
    CreateFacilityRef ref, String facilityId, String inventoryId) async {
  var url = Uri.https(baseURL, 'prod/createFacility');
  var response = await http.post(url,
      body: jsonEncode({
        "facility": {
          'id': facilityId,
          'type': "FACILITY",
          'name': "ABUAD Clinic",
          'address': "ABUAD Teaching Hospital",
          'state': "ekiti",
          'zone': "SW",
          'lga': "ado",
          'level': "PHC_PPM",
          'operation': "Private",
          'tbhiv': "STANDALONE",
          'microscopy': "AVAILABLE",
        },
        "inventoryId": inventoryId
      }));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  return true;
}

@riverpod
Future<bool> assignNationalUserToFacility(
    AssignNationalUserToFacilityRef ref, Map<String, dynamic> body) async {
  var url = Uri.https(baseURL, 'prod/assignUserToFacility');
  var response = await http.post(url, body: jsonEncode(body));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  return true;
}

@riverpod
Future<bool> assignUserToFacility(AssignUserToFacilityRef ref,
    String facilityId, String userId, bool microscopist) async {
  var url = Uri.https(baseURL, 'prod/assignUserToFacility');
  var response = await http.post(url,
      body: jsonEncode({
        "facilityId": facilityId,
        "userId": userId,
        "microscopist": microscopist
      }));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  return true;
}

@riverpod
Future<void> getUsers(GetUsersRef ref) async {
  final users = await http.get(Uri.https(baseURL, 'prod/getUsers'));
  print(users.body);
}

@riverpod
Future<bool> createFacilityTraining(
    CreateFacilityTrainingRef ref, String facilityId) async {
  String path = "createFacilityTraining";
  var url = Uri.https(baseURL, 'prod/$path');
  var body = {
    "month": "3",
    'year': "2005",
    'status': "TRAINED",
    'type': "LMIS",
    "facilityTrainingsId": facilityId
  };
  await http.post(url, body: jsonEncode(body));
  return true;
}

@riverpod
Future<bool> createStaffTraining(
    CreateStaffTrainingRef ref, String microscopistId) async {
  String path = "createStaffTraining";
  var url = Uri.https(baseURL, 'prod/$path');
  var body = {
    "month": "3",
    'year': "2005",
    'status': "TRAINED",
    'type': "AFB_Microscopy",
    "microscopistTrainingUserId": microscopistId
  };
  final response = await http.post(url, body: jsonEncode(body));
  print(response.body);
  return true;
}

@riverpod
Future<bool> createNationalUser(
    CreateNationalUserRef ref, Map<String, dynamic> user) async {
  var url = Uri.https(baseURL, 'prod/createUser');
  var response = await http.post(url, body: jsonEncode(user));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  return true;
}

@riverpod
Future<bool> createUser(
    CreateUserRef ref, bool microscopy, String userId) async {
  var abuadUser;
  if (!microscopy) {
    abuadUser = {
      'id': userId,
      'name': "ABUAD user",
      'email': "abuad@gmail.com",
      'designation': "HEAD_FACILITY",
      'cadre': "NURSE",
      'primaryNumber': "1987654321",
      'secondaryNumber': "01234567891",
      'zone': "sw",
      'state': "ekiti",
      'lga': "ado",
    };
  } else {
    abuadUser = {
      'name': "Microscopuy guy",
      'email': "micro@gmail.com",
      'id': userId,
      'designation': "MICROSCOPIST",
      'primaryNumber': "1987654321",
      'zone': "sw",
      'state': "ekiti",
      'lga': "ado",
      'secondaryNumber': "01234567891",
    };
  }
  var url = Uri.https(baseURL, 'prod/createUser');
  print(url);
  var response = await http.post(url, body: jsonEncode(abuadUser));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  return true;
}

@riverpod
Future<void> configure(ConfigureRef ref) async {
  final api = AmplifyAPI();
  await Amplify.addPlugins([api]);

  try {
    await Amplify.configure(ampconfig.amplifyConfig);
  } on AmplifyAlreadyConfiguredException {
    safePrint(
        'Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
  }
}

@riverpod
Future<void> createNewProduct(
    CreateNewProductRef ref, Map<String, dynamic> product) async {
  var response = await http.post(Uri.https(baseURL, 'prod/createNewProduct'),
      body: jsonEncode(product));
  safePrint(response.body);
}

@riverpod
Future<void> addProductsToNationalInventory(
  AddProductsToNationalInventoryRef ref,
  String warehouseId,
  List<dynamic> products,
  String inventoryId,
) async {
  var response = await http.post(Uri.https(baseURL, 'prod/addToInventory'),
      body: jsonEncode({
        "warehouseId": warehouseId,
        "products": products,
        "inventoryId": inventoryId
      }));
  safePrint(response.body);
}

@riverpod
Future<List<dynamic>> getInventory(
    GetInventoryRef ref, String facilityId) async {
  // final list = [
  //   {
  //     'id': '860e7cca-9251-4262-95f7-7526dd419c10',
  //     'quantity': 20,
  //     'pQuantityProductId': 'patientKit1',
  //     'pQuantityBatchInfoId': 'c8da7ecb-1250-4fd7-ac38-032ee0ce4c6e',
  //     'inventoryItemsId': 'adfasd89mj',
  //     'owner': null,
  //     'createdAt': '2024-04-04T19:55:24.139Z',
  //     'updatedAt': '2024-04-04T19:55:24.139Z',
  //     'product': {
  //       'id': 'patientKit1',
  //       'name': 'Patient Kit I',
  //       'description': 'Kit for TB patient',
  //       'owner': null,
  //       'createdAt': '2024-04-04T19:55:22.703Z',
  //       'updatedAt': '2024-04-04T19:55:22.703Z',
  //     },
  //     'batchInfo': {
  //       'batch': '1234',
  //       'expiryDate': '2025-11-11',
  //     },
  //   },
  //   {
  //     'id': 'dbdaf9cf-3b2c-4d94-b032-8350dcab1f72',
  //     'quantity': 20,
  //     'pQuantityProductId': 'patientKit1',
  //     'pQuantityBatchInfoId': 'f1e4dd02-139d-49b4-94d5-f4a7d4c2497c',
  //     'inventoryItemsId': 'adfasd89mj',
  //     'owner': null,
  //     'createdAt': '2024-04-04T19:55:23.983Z',
  //     'updatedAt': '2024-04-04T19:55:23.983Z',
  //     'product': {
  //       'id': 'patientKit1',
  //       'name': 'Patient Kit I',
  //       'description': 'Kit for TB patient',
  //       'owner': null,
  //       'createdAt': '2024-04-04T19:55:22.703Z',
  //       'updatedAt': '2024-04-04T19:55:22.703Z',
  //     },
  //     'batchInfo': {
  //       'batch': '123',
  //       'expiryDate': '2024-11-11',
  //     },
  //   }
  // ];

  var response = await http.get(
    Uri.https(baseURL, 'prod/getInventory', {"facilityId": facilityId}),
  );
  var og = jsonDecode(response.body)[0];
  // print(og);
  var items = (og["items"] as List);
  // var items = list as List;
  return List.generate(items.length, (index) {
    return {
      'pquantityId': items[index]['id'],
      'quantity': items[index]['quantity'],
      'name': items[index]['product']['name'],
      'batch': items[index]['batchInfo']['batch'],
      'expiry': items[index]['batchInfo']['expiryDate'],
      'id': items[index]['product']['id']
    };
  });
  // safePrint(jsonDecode(response.body)[0]);
  // var og = jsonDecode(response.body)[0];
  // var items = (og['items'] as List);
  // var items = (jsonDecode(response.body)[0]["items"] as List);
}

@riverpod
Future tester(TesterRef ref) async {
  var response = await http.get(Uri.https(
    baseURL,
    'prod/createTestPerson',
  ));
  safePrint(response.body);
}

@riverpod
Future<void> createSupply(
    CreateSupplyRef ref, Map<String, dynamic> data) async {
  final response = await http.post(Uri.https(baseURL, "prod/createNewSupply"),
      body: jsonEncode(data));
}

@riverpod
Future<void> createTestUsers(CreateTestUsersRef ref) async {
  await deleteAll();
  const facilityId = "SW/EK/ADO/FC/ABUAD/1";
  const userId = "SW/EK/ADO/HF/ABUAD/1";
  const microId = "SW/EK/ADO/MS/ABUAD/1";
  const lgaUserId = "NC/SW/EK/ADO/WH/1";
  const stateWarehouseId = "NC/SW/EK/WH/1";
  const stateUserId = "NC/SW/EK/HD/1";
  const zonalWarehouseId = "NC/SW/WH/1";
  const zonalUserId = "NC/SW/HF/1";
  const nationalUserId = "NC/WH/HF/1";
  const nationalWarehouseId = "NC/WH/1";
  const facilityInvetoryId = "asfhdsa87fsjkaf";
  const stateInventoryId = "83kjsdhgfkjashf789";
  const zoneInventoryId = "asdf234r";
  const natinoalInventoryId = "adfasd89mj";

  final facilityUser = {
    'name': "Mrs. Ahmad Funke",
    'email': "abuad@gmail.com",
    'id': userId,
    "userFacilityId": facilityId,
    'designation': "HEAD_FACILITY",
    "cadre": "NURSE",
    'primaryNumber': "07031562177",
    'zone': "sw",
    'state': "ekiti",
    'lga': "ado",
    'secondaryNumber': "08032764545",
  };
  final facilityMicroscopist = {
    'name': "Mrs Isinakaye",
    'email': "microscopist@gmail.com",
    'id': microId,
    'designation': "MICROSCOPIST",
    'primaryNumber': "07065386648",
    'zone': "sw",
    'state': "ekiti",
    'lga': "ado",
    'secondaryNumber': "08032756445",
  };

  final abuadFaciltiy = {
    "facility": {
      'id': facilityId,
      'type': "FACILITY",
      'name': "ABUAD Clinic",
      'address': "ABUAD Teaching Hospital",
      'state': "ekiti",
      'zone': "SW",
      'lga': "ado",
      'level': "PHC_PPM",
      'operation': "Private",
      'tbhiv': "STANDALONE",
      'microscopy': "AVAILABLE",
      "facilityInventorySummaryId": facilityInvetoryId,
      "facilityContactId": userId,
      "facilityMicroscopyContactId": microId
    },
  };

  final lgaUser = {
    'name': "Daramola B.M",
    'email': "lga@gmail.com",
    'id': lgaUserId,
    'designation': "HEAD_LGA",
    'primaryNumber': "08062163565",
    'zone': "sw",
    'state': "ekiti",
    'lga': "ado",
    'secondaryNumber': "08032764545",
  };
  final stateWarehouse = {
    "facility": {
      'id': stateWarehouseId,
      'type': "WAREHOUSE",
      'name': "Ekiti Warehouse",
      'address': "Ekiti Warehouse, Ado",
      'state': "ekiti",
      'zone': "SW",
      "facilityInventorySummaryId": stateInventoryId,
      "facilityContactId": stateUserId,
      "facilityMicroscopyContactId": null
    },
  };

  final stateUser = {
    'name': "Mrs. Orojo J.A",
    'email': "ekiti@gmail.com",
    'id': stateUserId,
    'designation': "HEAD_STATE",
    'primaryNumber': "08062163565",
    'zone': "sw",
    "userFacilityId": stateWarehouseId,
    'state': "ekiti",
    'secondaryNumber': "08032764545",
  };

  final zoneWarehouseFacility = {
    "facility": {
      'id': zonalWarehouseId,
      'type': "WAREHOUSE",
      'name': "SW Warehouse",
      'address': "SW Address Warehouse",
      'zone': "SW",
      "facilityInventorySummaryId": zoneInventoryId,
      "facilityContactId": zonalUserId,
      "facilityMicroscopyContactId": null
    },
  };
  final zoneUser = {
    'name': "Zonal Warehouse",
    'email': "sw@gmail.com",
    'id': zonalUserId,
    'designation': "HEAD_ZONE",
    "userFacilityId": zonalWarehouseId,
    'primaryNumber': "08062163565",
    'zone': "sw",
    'secondaryNumber': "08032764545",
  };

  final nationalWarehouseFacility = {
    "facility": {
      'id': nationalWarehouseId,
      'type': "WAREHOUSE",
      'name': "National Warehouse",
      'address': "Lagos, Nigeria",
      "facilityInventorySummaryId": natinoalInventoryId,
      "facilityContactId": nationalUserId,
      "facilityMicroscopyContactId": null
    },
  };
  final nationalUser = {
    'name': "National Head",
    'email': "national@gmail.com",
    'id': nationalUserId,
    "userFacilityId": nationalWarehouseId,
    'designation': "HEAD_NATION",
    'primaryNumber': "08062163565",
    'secondaryNumber': "08032764545",
  };
  var url = Uri.https(baseURL, 'prod/createUser');
  await http.post(url, body: jsonEncode(facilityUser));
  await http.post(url, body: jsonEncode(facilityMicroscopist));
  await http.post(url, body: jsonEncode(lgaUser));
  await http.post(url, body: jsonEncode(zoneUser));
  await http.post(url, body: jsonEncode(stateUser));
  await http.post(url, body: jsonEncode(nationalUser));

  print("Creating facilities....");
  await http.post(Uri.https(baseURL, 'prod/createFacility'),
      body: jsonEncode(abuadFaciltiy));
  await http.post(Uri.https(baseURL, 'prod/createFacility'),
      body: jsonEncode(stateWarehouse));
  await http.post(Uri.https(baseURL, 'prod/createFacility'),
      body: jsonEncode(zoneWarehouseFacility));
  await http.post(Uri.https(baseURL, 'prod/createFacility'),
      body: jsonEncode(nationalWarehouseFacility));

  print("creating trainings for facility...");

  String path = "createFacilityTraining";
  var trbody = {
    "date": TemporalDate.now().format(),
    'status': "TRAINED",
    'type': "LMIS",
    "facilityTrainingsId": facilityId
  };
  await http.post(Uri.https(baseURL, 'prod/$path'), body: jsonEncode(trbody));
  await ref.watch(createProductsAndAddProvider.future);
}

Future<void> deleteAll() async {
  await http.post(Uri.https(baseURL, "prod/deleteAll"));
}

@riverpod
Future<void> createProductsAndAdd(CreateProductsAndAddRef ref) async {
  // await deleteAll();
  final patientKit = {
    "name": "Patient Kit I",
    "description": "Kit for TB patient",
    "id": "patientKit1"
  };
  await http.post(Uri.https(baseURL, "prod/createNewProduct"),
      body: jsonEncode(patientKit));
  const nationalWarehouseId = "NC/WH/1";
  const natinoalInventoryId = "adfasd89mj";

  var newSupply = {
    "supplyReceiverId": nationalWarehouseId,
    "supplySenderId": nationalWarehouseId,
    "sendDate": TemporalDate.now().format(),
    "type": "NEW SHIPPMENTS",
    "id": "adfjas78asdjkf",
    "status": "RECEIVED"
  };
  print("Adding to national inventory");
  var productBatch = {
    "productBatchProductId": "patientKit1",
    "batch": "123",
    "quantity": 20,
    "expiryDate": "2024-11-11",
    "supplyProductsId": "adfjas78asdjkf",
  };
  var productBatch2 = {
    "productBatchProductId": "patientKit1",
    "batch": "1234",
    "supplyProductsId": "adfjas78asdjkf",
    "quantity": 20,
    "expiryDate": "2025-11-11",
  };
  var products = [productBatch, productBatch2];

  var response = await http.post(Uri.https(baseURL, 'prod/addToInventory'),
      body: jsonEncode({
        "supply": newSupply,
        "warehouseId": nationalWarehouseId,
        "products": products,
        "inventoryId": natinoalInventoryId,
        "others": [
          {
            "lossesAdjustements": 0,
            "stockBalance": 20,
            "date": TemporalDateTime.now().format()
          },
          {
            "lossesAdjustements": 0,
            "stockBalance": 40,
            "date": TemporalDateTime.now().format()
          },
        ]
      }));
  safePrint(response.body);
}

@riverpod
Future<void> updateInventory(UpdateInventoryRef ref, int quantity,
    String expiry, String batch, int stockBalance) async {
  // add to stock:
  // add to stock card, add to inventory update, pbatch
  final supplyId = uuid(secure: true);
  const natinoalInventoryId = "adfasd89mj";
  const nationalWarehouseId = "NC/WH/1";

  var newSupply = {
    "supplyReceiverId": nationalWarehouseId,
    "supplySenderId": nationalWarehouseId,
    "sendDate": TemporalDate.now().format(),
    "type": "NEW SHIPPMENTS",
    "id": supplyId,
    "status": "RECEIVED"
  };
  print("Adding to national inventory");
  var productBatch = {
    "productBatchProductId": "patientKit1",
    "batch": batch,
    "quantity": quantity,
    "expiryDate": expiry,
    "supplyProductsId": supplyId,
  };

  var response = await http.post(Uri.https(baseURL, 'prod/addToInventory'),
      body: jsonEncode({
        "supply": newSupply,
        "warehouseId": nationalWarehouseId,
        "products": [productBatch],
        "inventoryId": natinoalInventoryId,
        "others": [
          {
            "lossesAdjustements": 0,
            "stockBalance": stockBalance,
            "date": TemporalDateTime.now().format()
          },
        ]
      }));
}

@riverpod
Future<void> sendProducts(SendProductsRef ref, String receiver, String sender,
    List<Map<String, dynamic>> data) async {
  final supplyId = uuid(secure: true);

  var newSupply = {
    "supplyReceiverId": receiver,
    "supplySenderId": sender,
    "sendDate": TemporalDate.now().format(),
    "type": "NEW SHIPPMENTS",
    "id": supplyId,
    "status": "SENT"
  };
  List products = [];
  for (var i = 0; i < data.length; i++) {
    var current = data[i];
    var productBatch = {
      "productBatchProductId": current['pid'],
      "batch": current['batch'],
      "supplyProductsId": supplyId,
      "quantity": current['quantity'],
      "expiryDate": current['expiryDate'],
      "dateTime": TemporalDateTime.now().format(),
      "itemQuantityId": current['itemQuantityId'],
      "newQuantity": current['newQuantity'],
      'stockBalance': current['stockBalance'],
    };

    products.add(productBatch);
  }
  var response = await http.post(
    Uri.https(baseURL, 'prod/createNewSupply'),
    body: jsonEncode({
      "supply": newSupply,
      "productBatches": products,
    }),
  );
}

@riverpod
Future<List<dynamic>> getPendingDelivery(
    GetPendingDeliveryRef ref, String id) async {
  final pending = (await http
          .get(Uri.https(baseURL, "prod/getPendingSupply", {"receiverId": id})))
      .body;
  final data = jsonDecode(pending);
  return data;
  // return [
  //   {
  //     "id": "06e019fb-c374-4175-806f-7f82b56f7a7e",
  //     "sender": {"name": "National Warehouse"},
  //     "sendDate": "2024-04-05",
  //     "products": [
  //       {
  //         "id": "3f59f9b0-83f4-4532-8012-b1befc1ec532",
  //         "batch": "1234",
  //         "quantity": 4,
  //         "expiryDate": "2025-11-11",
  //         "supplyProductsId": "06e019fb-c374-4175-806f-7f82b56f7a7e",
  //         "productBatchPqInfoId": null,
  //         "productBatchProductId": "patientKit1",
  //         "owner": null,
  //         "createdAt": "2024-04-05T13:14:32.137Z",
  //         "updatedAt": "2024-04-05T13:14:32.137Z",
  //         "product": {
  //           "id": "patientKit1",
  //           "name": "Patient Kit I",
  //           "description": "Kit for TB patient",
  //           "owner": null,
  //           "createdAt": "2024-04-05T11:14:21.876Z",
  //           "updatedAt": "2024-04-05T11:14:21.876Z"
  //         }
  //       }
  //     ]
  //   }
  // ];
}

@riverpod
Future getAllSupplies(GetAllSuppliesRef ref) async {
  final pending = (await http.get(Uri.https(
          baseURL, "prod/getAllSupplies", {"receiverId": "NC/SW/WH/1"})))
      .body;
  print(jsonDecode(pending));
}

@riverpod
Future<bool> confirmSupplies(ConfirmSuppliesRef ref, Map<String, dynamic> data,
    List<Map<String, dynamic>> discrepancy) async {
  (await http.post(Uri.https(baseURL, "prod/confirmSupply"),
          body: jsonEncode(data)))
      .body;

  if (discrepancy.isNotEmpty) {
    (await http.post(Uri.https(baseURL, "prod/addDiscrepancy"),
            body: jsonEncode(discrepancy)))
        .body;
  }

  return false;
}



// receive supplies
// delivery descripancy
// product usage
// usage descripancy
// cost
// 10 patient index, months of stock cover, distribution
// separation of concern