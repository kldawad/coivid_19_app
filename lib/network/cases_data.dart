import 'dart:convert';

import 'package:http/http.dart' as http;

class CasesData {
  Future getCountryFlag() async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases'),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future getTotalCases() async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://corona.lmao.ninja/v2/all'),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
