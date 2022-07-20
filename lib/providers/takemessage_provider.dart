// ignore_for_file: unused_import

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
class takemessage_provider with ChangeNotifier {
  List<Mesaj> message = [];
  List usermessage = [];

  takemessage_provider() {
    takemessage();
  }

  Future<String> takemessage() async {
    final url0 = Uri.http(urlapi, 'api/mesaj');
    final rsp = await http.get(url0, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
    usermessage = message
        .where((e) =>
            e.kullaniciAdiG == userinfo.toString() &&
                e.kullaniciAdiA == ruser.toString() ||
            e.kullaniciAdiA == userinfo.toString() &&
                e.kullaniciAdiG == ruser.toString())
        .toList();
    print(usermessage);
    message = mesajFromJson(rsp.body);
    return "sucsess";
  }
}
