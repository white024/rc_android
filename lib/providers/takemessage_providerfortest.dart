// ignore_for_file: unused_import, non_constant_identifier_names, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:rc_android/GirisEkranlari/LoginUser.dart';
import 'package:rc_android/User/UserListU.dart';
import 'package:rc_android/models/message.dart';
import '../cons.dart';
import 'package:http/http.dart' as http;

// ignore: prefer_const_declarations
final urlapi = url;

// ignore: camel_case_types
class takemessage_provider_test with ChangeNotifier {
  List<Mesaj> message = [];

  Future<String> takemessage_test() async {
    final url0 = Uri.http(urlapi, 'api/mesaj');
    final rsp = await http.get(url0, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });

    message = mesajFromJson(rsp.body);
    print(message);
    return "sucsess";
  }
}
