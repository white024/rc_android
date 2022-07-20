// ignore_for_file: list_remove_unrelated_type, await_only_futures, avoid_print, missing_return

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:rc_android/GirisEkranlari/LoginUser.dart';
import 'package:rc_android/models/user.dart';
import '../cons.dart';
import 'package:http/http.dart' as http;

// ignore: prefer_const_declarations
final urlapi = url;

// ignore: camel_case_types
class userlistU_provider with ChangeNotifier {
  List<user> usersu = [];
  List result = [];

  userlistU_provider() {
    getusersu();
  }

  Future<String> getusersu() async {
    final url0 = Uri.http(urlapi, 'api/kullanici');
    final rsp = await http.get(url0, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });

    result =
        usersu.where((e) => e.kullaniciAdiU != userinfo.toString()).toList();
    print(result);
    usersu = userFromJson(rsp.body);
    return "sucsess";
  }
}
