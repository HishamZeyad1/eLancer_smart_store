import 'dart:convert';
import 'dart:io';

import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/models/base_api.dart';
import 'package:smart_store/models/city.dart';
import 'package:smart_store/models/favorite.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

import '../api_settings.dart';
import 'package:http/http.dart' as http;

class FavoriteApiController{
  Future<List<Favorite>> getFavorite() async {
    var url = Uri.parse(ApiSettings.favorite);
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: SharedPrefController().token,
      },
    );
    print("status: " + response.statusCode.toString());


      print("===================getFavorite======================");
      if (response.statusCode == 200) {
        print(response.body);
      var favoritiesJsonArray = jsonDecode(response.body)['list'] as List;
      print("citiesJsonArray:${favoritiesJsonArray.map((jsonObject) => Favorite.fromJson(jsonObject)).toList()}");
      return favoritiesJsonArray
          .map((jsonObject) => Favorite.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
  Future</*bool*/BaseApi?> favoriteProduct(Product product) async {
    print("================================");
    var url = Uri.parse(ApiSettings.favorite);
    var response = await http.post(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    },body: {
      'product_id':product.id.toString(),
    }
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200){
      var dataJson = jsonDecode(response.body);
      return BaseApi.fromJson(dataJson);
      // return true;
    }
    return null;
    // return false;
  }
}
