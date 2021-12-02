import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/models/user.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

import '../api_settings.dart';

class AuthApiController with Helpers {
  Future<bool> register(BuildContext context,
      {required User user}) async {
    var url = Uri.parse(ApiSettings.register);//
    var response = await http.post(url, body: {
      'name': user.name,
      'mobile': user.mobile.toString(),
      'password': user.password,
      'gender': user.gender,
      'city_id': user.city!.id.toString(),
      'STORE_API_KEY': ApiSettings.Store_API_Key,
    });
    if (response.statusCode == 200||response.statusCode == 201) {
      var jsonData=jsonDecode(response.body);
      print("code:"+jsonDecode(response.body)['code'].toString());
      print(jsonDecode(response.body)['message']);

      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }

Future<bool> verifyAccount(
  BuildContext context, {
  required String phoneNumber,
  required String code,
}) async {
  var url = Uri.parse(ApiSettings.activate);
  var response = await http.post(
    url,
    body: {
      'mobile': phoneNumber,
      'code': code
    },
    headers: {HttpHeaders.acceptHeader: 'application/json'},
  );

  if (response.statusCode == 200) {
    showSnackBar(
      context: context,
      message: jsonDecode(response.body)['message'],
    );
    return true;
  } else if (response.statusCode == 400) {
    showSnackBar(
      context: context,
      message: jsonDecode(response.body)['message'],
      error: true,
    );
  } else if (response.statusCode == 500) {
    showSnackBar(
      context: context,
      message: 'Something went wrong, try again',
      error: true,
    );
  }
  return false;
}

  Future<bool> login(BuildContext context,
      {required String phoneNumber, required String password}) async {
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(url, body: {
      'mobile': phoneNumber,
      'password': password,
    });
    if (response.statusCode == 200) {
      //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
      var jsonObject = jsonDecode(response.body)['data'];
      User user = User.fromJson(jsonObject);
      SharedPrefController().save(user: user);
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }

  Future<bool> logout() async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    });
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      return true;
    }
    return false;
  }
  //
  Future<Map<int,String>> forgetPassword(BuildContext context,
      {required String PhoneNumber}) async {
    var url = Uri.parse(ApiSettings.forgetPassword);
    var response = await http.post(url, body: {
      'mobile': PhoneNumber,
    });
    print(response.statusCode);


    if (response.statusCode == 200) {
      String code =jsonDecode(response.body)['code'].toString();
      print(code);
      return {1:"true",2:code};
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    } else {
      showSnackBar(
        context: context,
        message: 'Something went wrong, please try again!',
        error: true,
      );
    }
    return {1:"false",2:""};
  }

  //
  Future<bool> resetPassword(
    BuildContext context, {
    required String PhoneNumber,
    required String code,
    required String password,
  }) async {
    var url = Uri.parse(ApiSettings.resetPassword);
    var response = await http.post(
      url,
      body: {
        'mobile':PhoneNumber,
        'code': code,
        'password': password,
        'password_confirmation': password,
      },
      headers: {HttpHeaders.acceptHeader: 'application/json'},
    );

    if (response.statusCode == 200) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    } else if (response.statusCode == 500) {
      showSnackBar(
        context: context,
        message: 'Something went wrong, try again',
        error: true,
      );
    }
    return false;
  }
}
