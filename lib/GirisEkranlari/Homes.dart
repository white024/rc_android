// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Homes extends StatefulWidget {
  const Homes({Key key}) : super(key: key);

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: const Text('Çıkış ?'),
                actions: <Widget>[
                  FlatButton(
                    child: const Text('Tamam'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                  FlatButton(
                    child: const Text('İptal'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ],
              );
            });
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
                        "User",
                        style: TextStyle(fontSize: 16.5),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'ulogin');
                      }),
                  const SizedBox(
                    width: 40,
                  ),
                  RaisedButton(
                      child: const Text(
                        "Admin",
                        style: TextStyle(fontSize: 16.5),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'alogin');
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
