// ignore_for_file: deprecated_member_use, unused_import, avoid_print, prefer_is_empty, camel_case_types, duplicate_ignore, file_names, unused_local_variable

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rc_android/Admin/AddUser.dart';
import 'package:rc_android/main.dart';
import 'package:rc_android/models/admin.dart';
import 'package:rc_android/providers/admin_provider.dart';
import 'package:rc_android/public/Input_decor.dart';

var adminusername = TextEditingController();
var adminpassword = TextEditingController();
final formKey = GlobalKey<FormState>();
String err;

class LoginAdmin extends StatelessWidget {
  const LoginAdmin({Key key}) : super(key: key);

// ignore: camel_case_types

  //String usernameadmin;
  //String passwordadmin;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, 'home');
        return null;
      },
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              loginupadmin(size),
              icontext(),
              logindownadmin(context),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView logindownadmin(BuildContext context) {
    final adminprovider = Provider.of<admin_provider>(context);
    var admins = adminprovider.admins;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 320,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 410,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black87,
                  spreadRadius: 1,
                  blurRadius: 40,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  'Admin Giriş',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: adminusername,
                            //autovalidateMode: AutovalidateMode.always,
                            decoration: InputDecor.inputDecor(
                                labeltext: "Kullanıcı Adı",
                                icon: const Icon(Icons.person_outline)),
                            textInputAction: TextInputAction.next,
                            validator: (usera) {
                              if (usera == null || usera.isEmpty) {
                                return err.toString();
                              } else {
                                return null;
                              }
                            },
                            //controller: adminusername,

                            /*onSaved: (user) {
                        usernameadmin = user;
                      },*/
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: adminpassword,
                            obscureText: true,

                            //autovalidateMode: AutovalidateMode.always,
                            decoration: InputDecor.inputDecor(
                                labeltext: "Şifre",
                                icon: const Icon(Icons.lock_outline)),
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (pass) async {
                              if (formKey.currentState.validate()) {
                                logina(admins, context);
                                print("$adminusername, $adminpassword");
                                print(adminprovider.admins);
                                clear();
                              } else {
                                if (adminusername.text == "" ||
                                    adminusername.text == null &&
                                        adminpassword.text == "" ||
                                    adminpassword.text == null) {
                                  err = "kullanıcı Adı ve Şifre Giriniz.";
                                } else {
                                  err = "yanlış kullanıcı adı veya şifre";
                                }
                              }
                            },
                            validator: (passa) {
                              if (passa == null || passa.isEmpty) {
                                return err.toString();
                              } else {
                                return null;
                              }
                            },
                            /*onSaved: (pass) {
                        passwordadmin = pass;
                      },*/
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                disabledColor: Colors.grey,
                                color: const Color.fromARGB(255, 172, 11, 0),
                                child: const Text(
                                  "<- Çıkış",
                                  style: TextStyle(
                                      fontSize: 15.5,
                                      color:
                                          Color.fromARGB(255, 217, 217, 217)),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, 'home');
                                },
                              ),
                              const SizedBox(width: 55),
                              MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  disabledColor: Colors.grey,
                                  color: Colors.green,
                                  child: const Text(
                                    "Giriş ->",
                                    style: TextStyle(fontSize: 16.5),
                                  ),
                                  onPressed: () async {
                                    if (formKey.currentState.validate()) {
                                      logina(admins, context);
                                      print("$adminusername, $adminpassword");
                                      print(adminprovider.admins);
                                      clear();
                                    }
                                    //formKey.currentState.save();

                                    //Navigator.pop(context);
                                    //debugPrint("user : $usernameadmin , pass : $passwordadmin");
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void logina(List<admin> admins, BuildContext context) {
    if (admins
            .where((e) =>
                e.kullaniciAdiA == adminusername.text &&
                e.sifre == adminpassword.text)
            .length !=
        0) {
      Navigator.pushReplacementNamed(context, 'adduser');
    }
  }

  void clear() {
    adminusername.clear();
    adminpassword.clear();
  }

  SafeArea icontext() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 80),
        width: double.infinity,
        child: const Icon(
          Icons.admin_panel_settings,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}

Container loginupadmin(Size size) {
  return loginpanelcolor(size);
}

Container loginpanelcolor(Size size) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 66, 10, 150),
          Color.fromARGB(255, 150, 10, 122),
          Color.fromARGB(246, 150, 10, 26),
        ],
      ),
    ),
    width: double.infinity,
    height: size.height * 0.5,
    child: adminpaneltext(),
  );
}

Container adminpaneltext() {
  return Container(
    padding: const EdgeInsets.only(top: 22),
    child: const SafeArea(
      child: Text(
        "Admin Paneli",
        style: TextStyle(
            color: Colors.white, fontStyle: FontStyle.italic, fontSize: 39),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
