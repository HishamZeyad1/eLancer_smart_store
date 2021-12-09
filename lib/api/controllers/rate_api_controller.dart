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
class RateApiController{
  Future<BaseApi?> RateProduct(int productId,double rate) async {
    print("================================");
    var url = Uri.parse(ApiSettings.rating);
    var response = await http.post(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    },body: {
      'product_id':productId.toString(),
      'rate':rate.toString(),
    },
    );
    // print(response.statusCode);
    // print(response.body);
    //
    if (response.statusCode == 200){
      var dataJson = jsonDecode(response.body);
      return BaseApi.fromJson(dataJson);
      // return true;
    }
    return null;
    // return false;
  }

}