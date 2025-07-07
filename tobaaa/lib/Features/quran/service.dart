import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:toba2/Features/quran/presentation/models/Ayah_model.dart';

Future<List<AyahModel>> loadSurah(int surahNumber) async {
  final String response =
      await rootBundle.loadString('assets/quran_jsons/surah_$surahNumber.json');
  var json = jsonDecode(response);
  List<AyahModel> surah = [];
  for (int i = 0; i < json['count']; i++) {
    surah.add(AyahModel.fromJson(json: json, index: i));
  }
  return surah;
}
