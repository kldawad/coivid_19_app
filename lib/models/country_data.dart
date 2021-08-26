import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:covid_19_app/network/cases_data.dart';

CasesData casesData = CasesData();

class CountryData extends ChangeNotifier {
  List? countryData;
  Future fetchCountryData() async {
    countryData = await casesData.getCountryFlag();
    notifyListeners();
  }

  Map? worldData;
  Future fetchTotalCases() async {
    worldData = await casesData.getTotalCases();
    notifyListeners();
  }

  // UnmodifiableListView<dynamic> get countryData {
  //   return UnmodifiableListView(_countryData!);
  // }
}
