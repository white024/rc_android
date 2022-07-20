import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:rc_android/Admin/AddUser.dart';
import 'package:rc_android/Admin/UserListA.dart';
import 'package:rc_android/models/user.dart';
import '../cons.dart';
import 'package:http/http.dart' as http;

// ignore: prefer_const_declarations
final urlapi = url;
int adduserstatus;

// ignore: camel_case_types
class adduser_provider with ChangeNotifier {
  List<user> addusers = [];

  /*adduser_provider() {
    getaddusers();
  }*/

  getaddusers(String usern, passw) async {
    final url0 = Uri.http(urlapi, 'api/kullanici');
    Map adds = {
      'kullaniciAdiU': usern,
      'sifre': passw,
    };
    print(adds);

    String body = json.encode(adds);
    var response = await http.post(
      url0,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
      body: body,
    );
    await returmessage(response);
  }

  Future<dynamic> returmessage(http.Response response) async {
    adduserstatus = response.statusCode;
    print(response.statusCode);
    if (response.statusCode == 201) {
      //Or put here your next screen using Navigator.push() method
      print('success');
    } else {
      print('error');
    }
  }
}


  /*final rsp = await http.get(url0, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    final response = userFromJson(rsp.body);*/

