import 'dart:convert';
import 'dart:io';

import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/models/base_api.dart';
import 'package:smart_store/models/city.dart';
import 'package:smart_store/models/faqs.dart';
import 'package:smart_store/models/favorite.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

import '../api_settings.dart';
import 'package:http/http.dart' as http;

class FAQSApiController{
  Future<List<FAQS>> getFAQS() async {
    var url = Uri.parse(ApiSettings.faqs);
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: SharedPrefController().token,
        'lang': SharedPrefController().language
      },
    );
    print("=========================================");
    if (response.statusCode == 200) {
      print(response.body);
      var faqsJsonArray = jsonDecode(response.body)['list'] as List;

      return faqsJsonArray.map((e) => FAQS.fromJson(e)).toList();
      // print("citiesJsonArray:${favoritiesJsonArray.map((jsonObject) => Favorite.fromJson(jsonObject)).toList()}");
      // return faqsJsonArray
      //     .map((jsonObject) => FAQS.fromJson(jsonObject)).toList();
    }
    return [];
  }
  Future<BaseApi> SendContact(String subject,String message) async {
    print("================================");
    var url = Uri.parse(ApiSettings.contact);
    var response = await http.post(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
      'lang': SharedPrefController().language
    },body: {
      'subject':subject,
      'message':message,
    }
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200||response.statusCode == 201){
      var dataJson = jsonDecode(response.body);
      return BaseApi.fromJson(dataJson);
      // return true;
    }
    var dataJson = jsonDecode(response.body);
    return BaseApi.fromJson(dataJson);
    // return response.body;
    // return false;
  }

}
