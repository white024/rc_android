// ignore_for_file: deprecated_member_use, avoid_print, camel_case_types, unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rc_android/User/UserListU.dart';
import 'package:rc_android/providers/deletemessage_provider.dart';
import 'package:rc_android/providers/sendmesage_provider.dart';
import 'package:rc_android/providers/takemessage_provider.dart';
import 'package:rc_android/providers/takemessage_providerfortest.dart';
import 'package:rc_android/providers/uploadimage_provider.dart';
import 'package:rc_android/providers/user_provider.dart';

class denemee extends StatefulWidget {
  const denemee({Key key}) : super(key: key);

  @override
  State<denemee> createState() => _denemeeState();
}

String dene;
String a;

class _denemeeState extends State<denemee> {
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    final takemessageprovider = Provider.of<takemessage_provider>(context);
    final sendmessageprovider = Provider.of<sendmessage_provider>(context);
    final delmessageprovider = Provider.of<deletemessage_provider>(context);
    final addimageprovider = Provider.of<addimage_provider>(context);
    final userprovider = Provider.of<user_provider>(context);
    final takemessageprovidertest =
        Provider.of<takemessage_provider_test>(context);
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, 'home');
        return null;
      },
      child: Scaffold(
        body: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(80),
              child: Row(
                children: [
                  RaisedButton(
                      child: const Text(
                        "test",
                        style: TextStyle(fontSize: 16.5),
                      ),
                      onPressed: () {
                        setState(() {
                          try {
                            dene = takemessageprovider.message
                                .where((e) => e.messageType == "sender1")
                                .isNotEmpty
                                .toString();
                            print(dene);
                          } catch (e) {
                            print("hata $e");
                          }
                        });
                      }),
                  const SizedBox(
                    width: 40,
                  ),
                  RaisedButton(
                      child: const Text(
                        "test2",
                        style: TextStyle(fontSize: 16.5),
                      ),
                      onPressed: () {
                        setState(() {
                          takemessageprovidertest.takemessage_test();
                        });
                      }),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
