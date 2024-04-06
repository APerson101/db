import 'dart:convert';

import 'package:amplify_core/amplify_core.dart';
import 'package:ntblcp/providers/dataprovider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'creators.g.dart';

@riverpod
Future<void> recordMEdata(RecordMEdataRef ref, dynamic data) async {
  var response = await http.post(Uri.https(baseURL, "prod/MEData"),
      body: jsonEncode(data));
  safePrint(response.body);
}
