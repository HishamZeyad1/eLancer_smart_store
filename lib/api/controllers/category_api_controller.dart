
import 'dart:convert';
import 'dart:io';

import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/models/category.dart';
import 'package:http/http.dart'as http;
import 'package:smart_store/models/product.dart';
import 'package:smart_store/models/product_details.dart';
import 'package:smart_store/models/sub-category.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class CategoryApiController{
  Future<List<Category>> Categories() async {
    String token=SharedPrefController().token;
    print("================================");
    var url = Uri.parse(ApiSettings.categories);
    var response = await http.get(url, headers: {
    'Authorization':'${SharedPrefController().token}',
      // HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
      'lang': SharedPrefController().language
    });

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonDecode1= jsonDecode(response.body);
      print("==============jsonDecode1===============");
      print(jsonDecode1);

      var dataJson = jsonDecode(response.body)['list'] as List;
      return dataJson
          .map((jsonObject) => Category.fromJson(jsonObject)).toList();
    }
    return [];
  }
  Future<List<SubCategory>> subCategories(String id) async {
    // String token=SharedPrefController().token;

    print("================================");
    var url = Uri.parse(ApiSettings.subCategories+id);
    var response = await http.get(url, headers: {
      'Authorization':'${SharedPrefController().token}',
      // HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
      'lang': SharedPrefController().language
    });
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var dataJson = jsonDecode(response.body)['list'] as List;
      return dataJson
          .map((jsonObject) => SubCategory.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<List<Product>> products(String id) async {
    print("================================");
    var url = Uri.parse(ApiSettings.products+id);
    var response = await http.get(url, headers: {
      'Authorization':'${SharedPrefController().token}',

      // HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
      'lang': SharedPrefController().language
    });
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var dataJson = jsonDecode(response.body)['list'] as List;
      print("============products=============");
      print("${dataJson}");

      return dataJson
          .map((jsonObject) => Product.fromJson(jsonObject)).toList();
    }
    return [];
  }
  Future<ProductDetails?> productDetails(String id) async {
    print("===========productDetails=========");
    var url = Uri.parse(ApiSettings.productDetails+id);
    var response = await http.get(url, headers: {
      'Authorization':'${SharedPrefController().token}',
      // HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
      'lang': SharedPrefController().language
    });
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var dataJson = jsonDecode(response.body)['object'] ;
      print("=====================dataJson====================");
      print(dataJson);
      print("=====ProductDetails.fromJson(dataJson)=========");
      // print(ProductDetails.fromJson(dataJson));
      // ProductDetails p=ProductDetails.fromJson(dataJson);
      // print(p.id);
      try{
        print("Check Error");
        ProductDetails productDetails=ProductDetails.fromJson(dataJson);
      }catch(Exception){print(Exception.toString());}

      return ProductDetails.fromJson(dataJson);
    }
    return null;
  }

// Future<List<Category>> SubCategories(int id) async {
  //   print("================================");
  //   var url = Uri.parse(ApiSettings.categories);
  //   var response = await http.get(url, headers: {
  //     HttpHeaders.authorizationHeader: SharedPrefController().token,
  //     HttpHeaders.acceptHeader: 'application/json'
  //   });
  //   print(response.statusCode);
  //   print(response.body);
  //
  //   if (response.statusCode == 200) {
  //     var jsonDecode1= jsonDecode(response.body);
  //     print("==============jsonDecode1===============");
  //     print(jsonDecode1);
  //
  //     var dataJson = jsonDecode(response.body)['list'] as List;
  //     return dataJson
  //         .map((jsonObject) => Category.fromJson(jsonObject)).toList();
  //   }
  //   return [];
  // }
}