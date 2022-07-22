// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:io';
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
class addimage_provider with ChangeNotifier {
  List<user> addimages = [];

  /*adduser_provider() {
    getaddusers();
  }*/

  getaddimage(File image) async {
    final url0 = Uri.http(urlapi, 'api/kullanici/2');

    var bytes = image.readAsBytesSync();

    var response = await http.post(url0,
        headers: {
          "Content-Type": "multipart/form-data",
          "Access-Control-Allow-Methods": "*",
        },
        body: jsonEncode(<String, dynamic>{"image": bytes}),
        encoding: Encoding.getByName("utf-8"));

    return response.body;
    //await returmessage(response);
  }

  /*Future<dynamic> returmessage(http.Response response) async {
    adduserstatus = response.statusCode;
    print(response.statusCode);
    if (response.statusCode == 201) {
      //Or put here your next screen using Navigator.push() method
      print('success');
    } else {
      print('error');
    }
  }*/
}


  /*final rsp = await http.get(url0, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    final response = userFromJson(rsp.body);*/

