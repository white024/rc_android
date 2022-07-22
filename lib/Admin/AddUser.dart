// ignore_for_file: deprecated_member_use, avoid_types_as_parameter_names, avoid_print, non_constant_identifier_names, use_build_context_synchronously, unused_import, unnecessary_import, file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rc_android/models/user.dart';
import 'package:rc_android/providers/adduser_provider.dart';
import 'package:rc_android/providers/user_provider.dart';
import 'package:rc_android/public/Input_decor.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

int index;
TextEditingController id = TextEditingController();
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController ipcon = TextEditingController();
final formKey = GlobalKey<FormState>();
final myFocusNode = FocusNode();

class _AddUserState extends State<AddUser> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, 'alogin');
        return null;
      },
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Adduserup(size),
                const Addusericon(),
                Adduserdown(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView Adduserdown(BuildContext context) {
    final adduserprovider = Provider.of<adduser_provider>(context);
    final userprovider = Provider.of<user_provider>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 270,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 430,
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
                  'Ekle',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          /*TextFormField(
                            controller: id,
                            autofocus: true,
                            decoration: InputDecor.inputDecor(
                                labeltext: "ID",
                                icon: const Icon(Icons.numbers_outlined)),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            validator: (ID) {
                              if (ID == null || ID.isEmpty) {
                                return "ID Adı Giriniz.";
                              } else {
                                return null;
                              }
                            },
                          ),*/
                          TextFormField(
                            controller: username,
                            focusNode: myFocusNode,
                            autofocus: true,
                            decoration: InputDecor.inputDecor(
                                labeltext: "Kullanıcı Adı",
                                icon:
                                    const Icon(Icons.person_add_alt_outlined)),
                            onTap: () {
                              setState(() {
                                userprovider.getusers();
                              });
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (user) {
                              if (user == null || user.isEmpty) {
                                return "kullanıcı Adı Giriniz.";
                              } else {
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            controller: password,
                            decoration: InputDecor.inputDecor(
                                labeltext: "Şifre",
                                icon: const Icon(Icons.password_outlined)),
                            onTap: () {
                              setState(() {
                                userprovider.getusers();
                              });
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (pass) {
                              if (pass == null || pass.isEmpty) {
                                return "Şifre Giriniz.";
                              } else {
                                return null;
                              }
                            },
                            onFieldSubmitted: (pass) async {
                              if (formKey.currentState.validate()) {
                                setState(() {
                                  userprovider.getusers();
                                });
                                userprovider.getusers();
                                Future.delayed(
                                    const Duration(milliseconds: 500),
                                    () async {
                                  await controll(context);
                                });
                                await Addusercmd(adduserprovider, userprovider);
                                Future.delayed(
                                    const Duration(milliseconds: 1000), () {
                                  myFocusNode.requestFocus();
                                });
                              }
                            },
                          ),
                          /*TextFormField(
                            controller: ipcon,
                            decoration: InputDecor.inputDecor(
                                labeltext: "IP",
                                icon: const Icon(
                                    Icons.control_point_duplicate_outlined)),
                            onTap: () {
                              setState(() {
                                userprovider.getauserlists();
                              });
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            validator: (IP) {
                              if (IP == null || IP.isEmpty) {
                                return "IP Giriniz.";
                              } else {
                                return null;
                              }
                            },
                          ),*/
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  disabledColor: Colors.grey,
                                  color: Colors.green,
                                  child: const Text(
                                    "Ekle",
                                    style: TextStyle(fontSize: 16.5),
                                  ),
                                  onPressed: () async {
                                    if (formKey.currentState.validate()) {
                                      setState(() {
                                        userprovider.getusers();
                                      });
                                      userprovider.getusers();

                                      Future.delayed(
                                          const Duration(milliseconds: 500),
                                          () async {
                                        await controll(context);
                                      });
                                      await Addusercmd(
                                          adduserprovider, userprovider);
                                      Future.delayed(
                                          const Duration(milliseconds: 1000),
                                          () {
                                        myFocusNode.requestFocus();
                                      });
                                    }
                                  }),
                              const SizedBox(
                                width: 30,
                              ),
                              MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  disabledColor: Colors.grey,
                                  color: Colors.blueAccent,
                                  child: const Text(
                                    "Kullanıcı \n  Listesi",
                                    style: TextStyle(fontSize: 16.5),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, 'alista');
                                    setState(() {
                                      userprovider.getusers();
                                    });
                                  }),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 85,
                              ),
                              MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  disabledColor: Colors.grey,
                                  color: const Color.fromARGB(255, 172, 11, 0),
                                  child: const Text(
                                    "<- Çıkış",
                                    style: TextStyle(
                                        fontSize: 16.5,
                                        color:
                                            Color.fromARGB(255, 217, 217, 217)),
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      userprovider.getusers();
                                    });
                                    clear();
                                    Navigator.pushReplacementNamed(
                                        context, 'alogin');
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

  Future<dynamic> controll(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (adduserstatus == 201) {
        clear();
      } else {
        errmessage(context);
      }
    });
  }

  Future<dynamic> errmessage(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 700), () {
      AlertDialog alert = AlertDialog(
        title: const Text("Hata"),
        content: Text("Hata $adduserstatus"),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                clear();
                myFocusNode.requestFocus();
              },
              child: const Text("Tamam")),
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

  errmessage2(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 700), () {
      AlertDialog alert = AlertDialog(
        title: const Text("Hata"),
        content: const Text("Aynı kullanıcı adına sahip biri var"),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                clear();
                myFocusNode.requestFocus();
              },
              child: const Text("Tamam")),
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

  var control;
  Future<dynamic> Addusercmd(
      adduser_provider adduserprovider, user_provider userprovider) async {
    control = userprovider.users
        .map((e) => e.kullaniciAdiU == username.text)
        .where((element) => element == true)
        .toString();

    Future.delayed(const Duration(milliseconds: 5), () async {
      print(control);
      if (control == "(true)") {
        errmessage2(context);
      } else {
        adduserprovider.getaddusers(username.text, password.text);
      }
    });
  }

  Future<dynamic> clear() async {
    id.clear();
    username.clear();
    password.clear();
    ipcon.clear();
  }

  SafeArea Adduserpaneltext() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 22),
        child: const SafeArea(
          child: Text(
            "Kullanıcı Ekle",
            style: TextStyle(
                color: Colors.white, fontStyle: FontStyle.italic, fontSize: 39),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  SafeArea Adduserup(Size size) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 164, 0, 0),
              Color.fromARGB(255, 0, 0, 0),
            ])),
        width: double.infinity,
        height: size.height * 0.5,
        child: Adduserpaneltext(),
      ),
    );
  }
}

class Addusericon extends StatelessWidget {
  const Addusericon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 80),
        width: double.infinity,
        child: const Icon(
          Icons.person_add_alt_1_outlined,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
