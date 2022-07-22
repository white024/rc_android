// ignore_for_file: unused_import, avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:rc_android/Admin/AddUser.dart';
import 'package:rc_android/models/message.dart';
import '../cons.dart';
import 'package:http/http.dart' as http;

// ignore: prefer_const_declarations
final urlapi = url;
int sendmessagestat;

// ignore: camel_case_types
class sendmessage_provider with ChangeNotifier {
  List<Mesaj> sendmessages = [];

  /*sendmessage_provider() {
    getsendmessages();
  }*/

  getsendmessages(usersd, userrc, messagec, mtype, time, date) async {
    Map<String, dynamic> send = {
      'kullaniciAdiG': usersd,
      'kullaniciAdiA': userrc,
      'mesaj': messagec,
      'messageType': mtype,
      'saat': time,
      'tarih': date
    };
    final url0 = Uri.http(urlapi, 'api/mesaj');

    String body = jsonEncode(send);
    var response = await http.post(
      url0,
      body: body,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );

    print(send);
    await returmessage(response);
    print(url0);
  }

  Future<dynamic> returmessage(http.Response response) async {
    sendmessagestat = response.statusCode;
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

