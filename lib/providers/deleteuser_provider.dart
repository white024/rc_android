import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:rc_android/models/user.dart';
import '../cons.dart';
import 'package:http/http.dart' as http;

// ignore: prefer_const_declarations
final urlapi = url;

// ignore: camel_case_types
class delete_provider with ChangeNotifier {
  List<user> dellusers = [];

  /*delete_provider() {
    getdelusers();
  }*/

  getdelusers(String id) async {
    final url0 = Uri.http(urlapi, 'api/kullanici/$id');
    final http.Response rsp = await http.delete(url0, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    });
    if (rsp.body.isNotEmpty) {
      return rsp;
    }
  }
}
