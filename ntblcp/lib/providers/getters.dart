import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:ntblcp/providers/dataprovider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'getters.g.dart';

@riverpod
Future<List<dynamic>> getAllFacilities(
    GetAllFacilitiesRef ref, String region) async {
  var response = await http.get(Uri.https(baseURL, "prod/getFacilities"));
  safePrint(response.body);
  var facilitiesList = jsonDecode(response.body) as List;
  return facilitiesList;
}

@riverpod
Future<List<dynamic>> getLocationFacilities(
    GetLocationFacilitiesRef ref, dynamic region) async {
  return List.generate(
      10,
      (index) => {
            "name": "Test Name",
            "id": "Test ID",
            "lga": "ado",
            "address": "Test address",
            "contact": {
              "name": "contact name",
              "email": "contact@gmail.com",
              "cadre": "Nurse",
              "primaryNumber": "78324578",
              "secondaryNumber": "32423423"
            },
            "trainings": [
              ...List.generate(
                  3,
                  (index) => {
                        "date": TemporalDate.now().format(),
                        'status': "TRAINED",
                        'type': "LMIS",
                      })
            ],
            "level": "PHC_PPM",
            "operation": "Private",
            "tbhiv": "STANDALONE",
            "microscopy": "AVAILABLE",
            "microscopesInfo": [
              ...List.generate(
                  5,
                  (index) => {
                        "dateReceived": TemporalDate.now().format(),
                        "source": "FMoH",
                        "status": "FUNCTIONAL"
                      })
            ],
            "microscopyContact": null
          });
  var response = await http
      .get(Uri.https(baseURL, "prod/getAllFacilities", {"region": region}));
  safePrint(response.body);
  var facilitiesList = jsonDecode(response.body) as List;
  return facilitiesList;
}

@riverpod
Future<dynamic> getUser(GetUserRef ref, String email) async {
  // final duser = [
  //   {
  //     "name": "National Head",
  //     "designation": "HEAD_NATION",
  //     "state": null,
  //     "lga": null,
  //     "userFacilityId": "NC/WH/1",
  //     "id": "NC/WH/HF/1",
  //     "facility": {
  //       "name": "National Warehouse",
  //       "inventorySummary": {"id": "adfasd89mj"}
  //     }
  //   }
  // ];
  // return duser[0];

  // return {
  //   "name": "Zonal Warehouse",
  //   "designation": "HEAD_ZONE",
  //   "state": null,
  //   "lga": null,
  //   "userFacilityId": "NC/SW/WH/1",
  //   "id": "NC/SW/HF/1",
  //   "facility": {
  //     "name": "SW Warehouse",
  //     "inventorySummary": {"id": "asdf234r"}
  //   }
  // };
  var response =
      await http.get(Uri.https(baseURL, "prod/getUser", {"email": email}));
  safePrint(response.body);
  var user = jsonDecode(response.body)[0];
  return user;
}

@riverpod
Future<List<dynamic>> getReports(GetReportsRef ref, String? facilityId,
    String? minDate, String? maxDate) async {
  var cresponse = [
    {
      "date": "2024-03-29T10:44:22.926392000Z",
      "product": {"name": "Patient Kit I", "id": "patientKit1"},
      "batchNo": "1234",
      "facilityStockCardId": "NC/WH/1",
      "receiver": "NC/WH/1",
      "expiryDate": "2025-11-11",
      "lossesAdjustements": 0,
      "type": "INCOMING",
      "stockCardProductId": "patientKit1",
      "quantityIssued": null,
      "quantityReceived": 20,
      "stockBalance": 40,
      "remarks": null
    },
    {
      "date": "2024-03-29T10:44:22.924357000Z",
      "product": {"name": "Patient Kit I", "id": "patientKit1"},
      "batchNo": "123",
      "facilityStockCardId": "NC/WH/1",
      "receiver": "NC/WH/1",
      "expiryDate": "2024-11-11",
      "lossesAdjustements": 0,
      "stockCardProductId": "patientKit1",
      "type": "INCOMING",
      "quantityIssued": null,
      "quantityReceived": 20,
      "stockBalance": 20,
      "remarks": null
    }
  ];
  return cresponse;
  var response = await http.get(Uri.https(
      baseURL,
      "prod/getfacilityStockCardWithDates",
      {"facilityId": facilityId, "minDate": minDate, "maxDate": maxDate}));
  safePrint(response.body);
  var stockCards = jsonDecode(response.body);
  return stockCards;
}

@riverpod
Future<List<dynamic>> getFacilityProductStockCard(
    GetFacilityProductStockCardRef ref,
    String facilityId,
    String productId) async {
  var response = await http.get(Uri.https(baseURL, "prod/getfacilityStockCard",
      {"facilityId": facilityId, "productId": productId}));
  safePrint(response.body);
  var stockCards = jsonDecode(response.body);
  return stockCards;

  var cresponse = [
    {
      "date": "2024-03-29T10:44:22.926392000Z",
      "product": {"name": "Patient Kit I", "id": "patientKit1"},
      "batchNo": "1234",
      "facilityStockCardId": "NC/WH/1",
      "receiver": "NC/WH/1",
      "expiryDate": "2025-11-11",
      "lossesAdjustements": 0,
      "type": "INCOMING",
      "quantityIssued": null,
      "quantityReceived": 20,
      "stockBalance": 40,
      "remarks": null
    },
    {
      "date": "2024-03-29T10:44:22.924357000Z",
      "product": {"name": "Patient Kit I", "id": "patientKit1"},
      "batchNo": "123",
      "facilityStockCardId": "NC/WH/1",
      "receiver": "NC/WH/1",
      "expiryDate": "2024-11-11",
      "lossesAdjustements": 0,
      "type": "INCOMING",
      "quantityIssued": null,
      "quantityReceived": 20,
      "stockBalance": 20,
      "remarks": null
    }
  ];
  return cresponse;
}
