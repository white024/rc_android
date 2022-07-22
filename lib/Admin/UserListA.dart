// ignore_for_file: avoid_print, camel_case_types, unused_element, must_call_super, prefer_typing_uninitialized_variables, deprecated_member_use, prefer_interpolation_to_compose_strings, unnecessary_const, sort_child_properties_last, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rc_android/Admin/AddUser.dart';
import 'package:rc_android/models/user.dart';
import 'package:rc_android/providers/adduser_provider.dart';
import 'package:rc_android/providers/deleteuser_provider.dart';
import 'package:rc_android/providers/updateuser_provider.dart';
import 'package:rc_android/providers/user_provider.dart';

class UserListA extends StatefulWidget {
  const UserListA({Key key}) : super(key: key);

  @override
  State<UserListA> createState() => _UserListAState();
}

TextEditingController idu = TextEditingController();
TextEditingController usernameu = TextEditingController();
TextEditingController passwordu = TextEditingController();
final formKey = GlobalKey<FormState>();
var controladd;

class _UserListAState extends State<UserListA> {
  @override
  Widget build(BuildContext context) {
    const MaterialApp();
    final userprovider = Provider.of<user_provider>(context);
    final delluserprovider = Provider.of<delete_provider>(context);
    final upuserprovider = Provider.of<updateuser_provider>(context);
    //var upusers = upuserprovider.updusers;

    setState(() {
      userprovider.getusers();
    });

    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, 'adduser');
        return null;
      },
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: 'refresh',
                  onPressed: () {
                    setState(() {
                      userprovider.getusers();
                    });
                  },
                ),
              ],
              title: const Text('Kullanıcı Listesi'),
              titleSpacing: 00.0,
              centerTitle: true,
              toolbarHeight: 60.2,
              toolbarOpacity: 0.8,
              elevation: 50.0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'back',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'adduser');
                },
              ),
            ), //AppBar
            body: RefreshIndicator(
                child: ListView.builder(
                  itemCount: userprovider.users == null
                      ? 0
                      : userprovider.users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      background: Container(
                        color: Colors.blue,
                        child: const Align(
                          child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Icon(Icons.edit),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      secondaryBackground: Container(
                        color: Colors.red,
                        child: const Align(
                          child: Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(Icons.delete),
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      ),
                      // ignore: missing_return
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.endToStart) {
                          Future.delayed(const Duration(microseconds: 1000),
                              () {
                            setState(() {
                              delluserprovider.getdelusers(userprovider
                                  .users[index].idKullanici
                                  .toString());
                            });
                          });

                          Future.delayed(const Duration(milliseconds: 1500),
                              () async {
                            Scaffold.of(context).showSnackBar(const SnackBar(
                                content:
                                    const Text("Item dismissed successfully")));
                            await userprovider.getusers();
                            setState(() {
                              userprovider.getusers();
                            });
                          });
                        } else {
                          return showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("edit"),
                                  backgroundColor: Colors.white,
                                  content: SizedBox(
                                    height: 225,
                                    width: 200,
                                    child: Form(
                                      key: formKey,
                                      child: Column(
                                        children: [
                                          /*Padding(
                                          padding: const EdgeInsets.only(top: 9.0),
                                          child: Expanded(
                                          child: Flexible(
                                          child: TextField(
                                              textCapitalization:
                                                  TextCapitalization.sentences,
                                              keyboardType: TextInputType.number,
                                              controller: idu,
                                              decoration: const InputDecoration(
                                                labelText: "ID",
                                              )),
                                             ),
                                            ),
                                          ),*/
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 9.0),
                                            child: TextFormField(
                                              textCapitalization:
                                                  TextCapitalization.sentences,
                                              keyboardType: TextInputType.text,
                                              controller: usernameu,
                                              decoration: const InputDecoration(
                                                labelText: "Kullanıcı Adı",
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 9.0),
                                            /*child: Expanded(*/

                                            child: TextFormField(
                                              textCapitalization:
                                                  TextCapitalization.sentences,
                                              keyboardType: TextInputType.text,
                                              controller: passwordu,
                                              decoration: const InputDecoration(
                                                labelText: "Şifre",
                                              ),
                                            ),
                                          ),

                                          /*),*/
                                          /* Padding(
                                            padding:
                                                const EdgeInsets.only(top: 9.0),
                                            child: TextField(
                                                textCapitalization:
                                                    TextCapitalization.sentences,
                                                keyboardType: TextInputType.number,
                                                controller: ipconu,
                                                decoration: const InputDecoration(
                                                  labelText: "IP",
                                                )),
                                          ),*/
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    FlatButton(
                                        onPressed: () async {
                                          controladd = userprovider.users
                                              .map((e) =>
                                                  e.kullaniciAdiU ==
                                                  usernameu.text)
                                              .where(
                                                  (element) => element == true)
                                              .toString();

                                          if (controladd == "(true)") {
                                            errmessage2(context);
                                          } else {
                                            if (usernameu.text == "" ||
                                                usernameu == null) {
                                              usernameu.text = userprovider
                                                  .users[index].kullaniciAdiU
                                                  .toString();
                                            } else {
                                              usernameu.text;
                                            }
                                            if (passwordu.text == "" ||
                                                usernameu == null) {
                                              passwordu.text = userprovider
                                                  .users[index].sifre
                                                  .toString();
                                            } else {
                                              passwordu.text;
                                            }
                                            setState(() {
                                              upuserprovider.getupdateusers(
                                                idu.text = userprovider
                                                    .users[index].idKullanici
                                                    .toString(),
                                                usernameu.text,
                                                passwordu.text,
                                              );

                                              /*upuserprovider.getupdateusers(
                                          idu.text,
                                          usernameu.text,
                                          passwordu.text,
                                          ipconu.text);*/

                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1200),
                                                  () async {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pop();
                                                clear();
                                                await userprovider.getusers();
                                                setState(() {
                                                  userprovider.getusers();
                                                });
                                              });
                                            });
                                            await clear();
                                          }
                                        },
                                        child: const Text("Tamam")),
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                          clear();
                                        },
                                        child: const Text("İptal")),
                                  ],
                                );
                              });

                          /*SnackBar(
                      action: SnackBarAction(label: 'Undo', onPressed: () {}),
                    );*/

                        }
                      },
                      key: UniqueKey(),
                      child: ListTile(
                        title: Text("Kullanıcı: " +
                            userprovider.users[index].kullaniciAdiU),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("ID: " +
                                userprovider.users[index].idKullanici
                                    .toString()),
                            Text("Şifre: " + userprovider.users[index].sifre),
                          ],
                        ),
                        leading: const Icon(Icons.person),
                        trailing: CircleAvatar(
                          child: Text(index.toString()),
                        ),
                        onTap: () async {
                          print("$index tıklandı.");
                        },
                        onLongPress: () => print("$index uzun basma."),
                      ),
                    );
                  },
                ),
                onRefresh: () async {
                  await Future.delayed(const Duration(milliseconds: 2000));
                  setState(() {
                    userprovider.getusers();
                  });
                })),
      ),
    );
  }
}

Future<dynamic> clear() async {
  usernameu.clear();
  passwordu.clear();
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

/*class userl {
  String username;
  String userno;
  userl(this.username, this.userno);
}*/
