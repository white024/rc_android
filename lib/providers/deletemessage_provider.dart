import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:rc_android/models/message.dart';
import 'package:rc_android/models/user.dart';
import '../cons.dart';
import 'package:http/http.dart' as http;

// ignore: prefer_const_declarations
final urlapi = url;

// ignore: camel_case_types
class deletemessage_provider with ChangeNotifier {
  List<Mesaj> dellmessage = [];

  /*delete_provider() {
    getdelusers();
  }*/

  getdelmessage(String id) async {
    final url0 = Uri.http(urlapi, 'api/mesaj/$id');
    final http.Response rsp = await http.delete(url0, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    });
    print(rsp.statusCode);

    return rsp;
  }
}
