// ignore_for_file: deprecated_member_use, missing_return, prefer_interpolation_to_compose_strings, avoid_print, unused_local_variable, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rc_android/GirisEkranlari/LoginUser.dart';
import 'package:rc_android/User/MessagesU.dart';
import 'package:rc_android/providers/takemessage_provider.dart';
import 'package:rc_android/providers/user_provider.dart';
import 'package:rc_android/providers/userlistu_provider.dart';
import 'package:rc_android/providers/userstat_provider.dart';

class UserListU extends StatefulWidget {
  const UserListU({Key key}) : super(key: key);

  @override
  State<UserListU> createState() => _UserListUState();
}

String ruser;
String stt;
int index;
bool _isLoading = false;

class _UserListUState extends State<UserListU> {
  @override
  Widget build(BuildContext context) {
    final userprovideru = Provider.of<userlistU_provider>(context);
    final takemessageprovider = Provider.of<takemessage_provider>(context);
    final userstatprovider = Provider.of<userstat_provider>(context);
    final userprovider = Provider.of<user_provider>(context);

    Future.delayed(const Duration(milliseconds: 2500), () async {
      setState(() {
        _isLoading = true;
      });
      setState(() {
        userprovideru.getusersu();
        stt;
      });
      setState(() {
        _isLoading = false;
      });
      print(_isLoading);
    });
    setState(() {
      userprovideru.getusersu();
    });

    return WillPopScope(
      onWillPop: () async {
        logout(userstatprovider);
        await Navigator.pushReplacementNamed(context, 'ulogin');
        return null;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Comment Icon',
              onPressed: () {
                setState(() {
                  userprovideru.getusersu();
                });
              },
            ),
          ],
          title: Text('Random Chat \n Hoş geldin $userinfo'),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          elevation: 50.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Comment Icon',
            onPressed: () {
              logout(userstatprovider);
              Navigator.pushReplacementNamed(context, 'ulogin');
            },
          ),
        ),
        body: RefreshIndicator(
            child: ListView.builder(
              itemCount: userprovideru.result == null
                  ? 0
                  : userprovideru.result.length,
              itemBuilder: (BuildContext context, index) {
                if (userprovideru.result[index].durum == true) {
                  stt = ("online");
                } else {
                  stt = ("offline");
                }

                return Container(
                  key: UniqueKey(),
                  child: Card(
                    child: ListTile(
                      title: Text("Kullanıcı: " +
                          userprovideru.result[index].kullaniciAdiU),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(userprovideru.result[index].idKullanici
                              .toString()),
                        ],
                      ),
                      leading: const Icon(Icons.person),
                      trailing: SizedBox(
                        child: Text(stt),
                      ),
                      onTap: () async {
                        print("$index tıklandı.");
                        Navigator.pushReplacementNamed(context, 'message');
                        takemessageprovider.usermessage = [];
                        setState(() {
                          takemessageprovider.takemessage();
                        });

                        stc = userprovideru.result
                            .where((element) =>
                                element.kullaniciAdiU ==
                                userprovideru.result[index].kullaniciAdiU)
                            .single
                            .durum;
                        userr = userprovideru.result
                            .where((element) =>
                                element.kullaniciAdiU ==
                                userprovideru.result[index].kullaniciAdiU)
                            .single
                            .kullaniciAdiU;

                        ruser = userprovideru.result[index].kullaniciAdiU;
                      },
                      onLongPress: () => print("$index uzun basma."),
                    ),
                  ),
                );
              },
            ),
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 2000));
              setState(() {
                userprovideru.getusersu();
              });
            }),
      ),
    );

    /*return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.only(right: 80, left: 160),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hello Frends"),
            RaisedButton(
                child: const Text(
                  "<- Çıkış",
                  style: TextStyle(fontSize: 16.5),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'ulogin');
                }),
          ],
        )),
      ),
    );*/
  }

  void logout(userstat_provider userstatprovider) {
    userstatprovider.getuserstats(statall, stuname, stpass, false);
  }
}
