import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:rc_android/models/admin.dart';
import '../cons.dart';
import 'package:http/http.dart' as http;

// ignore: prefer_const_declarations
final urlapi = url;

// ignore: camel_case_types
class admin_provider with ChangeNotifier {
  List<admin> admins = [];

  admin_provider() {
    getadmins();
  }

  getadmins() async {
    final url0 = Uri.http(urlapi, 'api/Yonetici');
    final rsp = await http.get(url0, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
    final response = adminFromJson(rsp.body);
    admins = response;
    notifyListeners();
  }
}
