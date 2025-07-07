import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:toba2/Features/azkar/presentation/models/azkar_model.dart';
import 'package:toba2/Features/azkar/presentation/models/one_zkr_model.dart';

Future<List<OneZkrModel>> loadAzkar(int index) async {
  final String response = await rootBundle.loadString('assets/adhkar.json');
  var json = jsonDecode(response);
  AzkarModel azkar = AzkarModel.fromJson(json: json, index: index);
  return azkar.azkar.map((e) => OneZkrModel.fromJson(json: e)).toList();
}
