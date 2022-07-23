// ignore_for_file: avoid_print, non_constant_identifier_names, duplicate_ignore, missing_return, unused_import

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:rc_android/GirisEkranlari/LoginUser.dart';
import 'package:rc_android/models/user.dart';
import '../cons.dart';
import 'package:http/http.dart' as http;

// ignore: prefer_const_declarations
final urlapi = url;

// ignore: camel_case_types
class user_provider with ChangeNotifier {
  List<User> users = [];

  user_provider() {
    getusers();
  }

  Future<String> getusers() async {
    final url0 = Uri.http(urlapi, 'api/kullanici');
    final rsp = await http.get(url0, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
    users = userFromJson(rsp.body);

    return "sucsess";
  }
}
