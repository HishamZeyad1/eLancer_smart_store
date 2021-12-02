import 'dart:convert';
import 'dart:io';

import 'package:smart_store/models/city.dart';

import '../api_settings.dart';
import 'package:http/http.dart' as http;

class CityApiController {
  Future<List<City>> getCities() async {
    var url = Uri.parse(ApiSettings.cities);
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
      },
    );
    print("status: " + response.statusCode.toString());

    if (response.statusCode == 200) {
      print(response.body);
      var citiesJsonArray = jsonDecode(response.body)['list'] as List;
      print("citiesJsonArray:${citiesJsonArray}");
      return citiesJsonArray
          .map((jsonObject) => City.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
}
