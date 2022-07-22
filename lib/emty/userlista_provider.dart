// ignore_for_file: deprecated_member_use, unused_import

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:rc_android/Admin/UserListA.dart';
import 'package:rc_android/models/user.dart';
import '../cons.dart';
import 'package:http/http.dart' as http;

// ignore: prefer_const_declarations
final urlapi = url;

// ignore: camel_case_types
class AUserList_provider with ChangeNotifier {
  List<user> auserlists = [];

  AUserList_provider() {
    getauserlists();
  }

  Future<String> getauserlists() async {
    final url0 = Uri.http(urlapi, 'api/kullanici');
    final rsp = await http.get(url0, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
    auserlists = userFromJson(rsp.body);
    return "sucsess";
  }
}
