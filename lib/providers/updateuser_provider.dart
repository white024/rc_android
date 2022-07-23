// ignore_for_file: avoid_print, non_constant_identifier_names, unused_element, unnecessary_new, unnecessary_string_interpolations, unused_import

import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:rc_android/Admin/AddUser.dart';
import 'package:rc_android/models/user.dart';
import '../cons.dart';
import 'package:http/http.dart' as http;

// ignore: prefer_const_declarations
final urlapi = url;

// ignore: camel_case_types
class updateuser_provider with ChangeNotifier {
  List<User> updusers = [];

  /*adduser_provider() {
    getaddusers();
  }*/

  getupdateusers(String Id, usern, passw) async {
    final url0 = Uri.http(urlapi, 'api/kullanici/$Id');
    try {
      print('Send Request : ');
      Map<String, String> headers = new HashMap();
      headers['Accept'] = 'application/json';
      headers['Content-type'] = 'application/json';

      http.Response response = await http.put(url0,
          headers: headers,
          body: jsonEncode({
            'idKullanici': Id,
            'kullaniciAdiU': usern,
            'sifre': passw,
          }),
          encoding: Encoding.getByName('utf-8'));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print("sucsess");
    } catch (error) {
      print("${error.toString()}");
    }
  }
}

void _sendRequest() async {}

  /*final rsp = await http.get(url0, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    final response = userFromJson(rsp.body);*/

