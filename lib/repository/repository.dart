import 'dart:convert';

import 'package:flutter_quran_api/models/surah_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://equran.id/api';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/surat'));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<SurahModel> surah = it.map((e) => SurahModel.fromJson(e)).toList();

        return surah;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
