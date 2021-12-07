

import 'dart:convert';
import 'dart:io';

import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/models/home.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

import '../api_settings.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:io';

class HomeApiController with Helpers {


  Future<Home?> getHome() async {
    print("================================");
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    });
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
     var jsonDecode1= jsonDecode(response.body);
     print("==============jsonDecode1===============");
     print(jsonDecode1);

     var dataJson = jsonDecode(response.body)['data'];
     // var categoriesJsonArray = jsonDecode(response.body)['data']['categories'] as List;
     // var latest_productsJsonArray = jsonDecode(response.body)['data']['latest_products'] as List;
     // var famous_productsJsonArray = jsonDecode(response.body)['data']['famous_products'] as List;
     print("==============Home.fromJson===============");
     var s=Home.fromJson(dataJson);
     print(s.famousProducts);
     return s;
     // return dataJson
     //     .map((jsonObject) => Home.fromJson(jsonObject));
    }
    return null;
  }
}