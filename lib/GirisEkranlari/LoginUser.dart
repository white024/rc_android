// ignore_for_file: deprecated_member_use, prefer_is_empty, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:rc_android/Admin/AddUser.dart';
import 'package:rc_android/User/UserListU.dart';
import 'package:rc_android/main.dart';
import 'package:rc_android/models/user.dart';
import 'package:rc_android/providers/user_provider.dart';
import 'package:rc_android/providers/userstat_provider.dart';
import 'package:rc_android/public/Input_decor.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({Key key}) : super(key: key);

  @override
  State<LoginUser> createState() => _LoginUserState();
}

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
String stuname;
String stpass;
String userinfo;
String userid;
var statall;
final formKeyu = GlobalKey<FormState>();

class _LoginUserState extends State<LoginUser> {
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
          body: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Userloginup(size),
                  Usericon(),
                  Userlogindown(context),
                ],
              ))),
    );
  }

  SingleChildScrollView Userlogindown(BuildContext context) {
    final userprovider = Provider.of<user_provider>(context);
    final userstatprovider = Provider.of<userstat_provider>(context);
    var userss = userprovider.users;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 285,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 395,
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
                  'Giriş',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  child: Form(
                      key: formKeyu,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              controller: username,
                              //autovalidateMode: AutovalidateMode.always,
                              decoration: InputDecor.inputDecor(
                                  labeltext: "Kullanıcı Adı",
                                  icon: const Icon(Icons.person_outline)),
                              textInputAction: TextInputAction.next,
                              validator: (useru) {
                                if (useru == null || useru.isEmpty) {
                                  return "kullanıcı Adı Giriniz.";
                                } else {
                                  return null;
                                }
                              },
                              /*onSaved: (user) {
                      usernameadmin = user;
                    },*/
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: password,
                              //autovalidateMode: AutovalidateMode.always,
                              decoration: InputDecor.inputDecor(
                                  labeltext: "Şifre",
                                  icon: const Icon(Icons.lock_outline)),
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (IP) async {
                                if (formKeyu.currentState.validate()) {
                                  //formKey.currentState.save();

                                  loginu(userss, context, userstatprovider,
                                      userprovider);
                                  print("$username, $password");
                                  print(userprovider.users);
                                  userinfo = username.text;
                                  clear();
                                  //Navigator.pop(context);
                                  //debugPrint("user : $usernameadmin , pass : $passwordadmin");

                                }
                              },
                              validator: (passu) {
                                if (passu == null || passu.isEmpty) {
                                  return "Şifrenizi Giriniz.";
                                } else {
                                  return null;
                                }
                              },
                              /*onSaved: (pass) {
                      passwordadmin = pass;
                    },*/
                            ),
                            const SizedBox(height: 32),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 25),
                                    MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        disabledColor: Colors.grey,
                                        color: const Color.fromARGB(
                                            255, 172, 11, 0),
                                        child: const Text(
                                          "<- Çıkış",
                                          style: TextStyle(fontSize: 16.5),
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context, 'home');
                                        }),
                                    const SizedBox(width: 40),
                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      disabledColor: Colors.grey,
                                      color: Colors.green,
                                      child: const Text(
                                        "Giriş ->",
                                        style: TextStyle(fontSize: 16.5),
                                      ),
                                      onPressed: () async {
                                        if (formKeyu.currentState.validate()) {
                                          //formKey.currentState.save();

                                          await loginu(userss, context,
                                              userstatprovider, userprovider);
                                          print("$username, $password");
                                          print(userprovider.users);
                                          userinfo = username.text;
                                          clear();
                                          //Navigator.pop(context);
                                          //debugPrint("user : $usernameadmin , pass : $passwordadmin");

                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  user us;

  Future loginu(List<user> users, BuildContext context,
      userstat_provider userstatprovider, user_provider userprovider) async {
    if (userprovider.users
            .where((e) => e.kullaniciAdiU == stuname && e.sifre == stpass) !=
        null) {}
    print(id);
    if (users
            .where((e) =>
                e.kullaniciAdiU == username.text && e.sifre == password.text)
            .length !=
        0) {
      stuname = username.text;
      stpass = password.text;
      statall = users
          .where((element) => element.kullaniciAdiU == stuname)
          .single
          .idKullanici;
      print(statall);
      userstatprovider.getuserstats(
          statall, stuname.toString(), stpass.toString(), true);

      Navigator.pushReplacementNamed(context, 'ulistu');
    }
  }

  void clear() {
    username.clear();
    password.clear();
  }

  SafeArea Usericon() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 80),
        width: double.infinity,
        child: const Icon(
          Icons.person_outline,
          size: 100,
        ),
      ),
    );
  }

  Container Userloginup(Size size) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(255, 255, 179, 0),
            Color.fromARGB(255, 0, 0, 0),
          ],
        ),
      ),
      width: double.infinity,
      height: size.height * 0.4,
      child: Userpaneltext(),
    );
  }

  Container Userpaneltext() {
    return Container(
      padding: const EdgeInsets.only(top: 22),
      child: const SafeArea(
        child: Text(
          "Kullanıcı Paneli",
          style: TextStyle(
              color: Colors.black, fontStyle: FontStyle.italic, fontSize: 40),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
