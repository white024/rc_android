// ignore_for_file: deprecated_member_use, file_names, sort_child_properties_last, avoid_print

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart' hide DismissDirection;
import 'package:rc_android/emty/mydismis.dart';

class Homes extends StatefulWidget {
  const Homes({Key key}) : super(key: key);

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  final colorizeColors = [
    Colors.purple,
    const Color.fromARGB(255, 85, 85, 85),
    Colors.purple,
    const Color.fromARGB(255, 86, 86, 86),
  ];

  final colorizeTextStyle = const TextStyle(
    fontSize: 40,
    fontFamily: 'Horizon',
  );
  final colorizeColors2 = [
    const Color.fromARGB(255, 160, 160, 160),
    const Color.fromARGB(255, 255, 255, 255),
    const Color.fromARGB(255, 148, 148, 148),
    const Color.fromARGB(255, 255, 255, 255),
  ];

  final colorizeTextStyle2 = const TextStyle(
    fontSize: 25,
    fontFamily: 'Horizon',
  );
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return dismis(context);
  }

  Dismissiblemy dismis(BuildContext context) {
    return Dismissiblemy(
        // direction: DismissDirection.all,
        background: Container(
          color: const Color.fromARGB(255, 255, 145, 0),
          child: const Align(
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Icon(Icons.person_outline),
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
        secondaryBackground: Container(
          color: const Color.fromARGB(255, 102, 0, 255),
          child: const Align(
            child: Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.admin_panel_settings_outlined),
            ),
            alignment: Alignment.centerRight,
          ),
        ),
        key: const ValueKey("dismiss_key"),
        child: home(context),
        confirmDismiss: (direction) {
          if (direction == DismissDirection.endToStart) {
            Navigator.pushReplacementNamed(context, 'alogin');
          } else if (direction == DismissDirection.startToEnd) {
            Navigator.pushReplacementNamed(context, 'ulogin');
          } else if (direction == DismissDirection.up) {
            Navigator.pushReplacementNamed(context, 'test');
          }
          return null;
        });
  }

  Scaffold home(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
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
      child: SafeArea(
        child: Scaffold(
          body: Container(
              width: 420,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.all(80),
                  //   child: Row(
                  //     children: [
                  //       RaisedButton(
                  //           child: const Text(
                  //             "User",
                  //             style: TextStyle(fontSize: 16.5),
                  //           ),
                  //           onPressed: () {
                  //             Navigator.pushReplacementNamed(context, 'ulogin');
                  //           }),
                  //       const SizedBox(
                  //         width: 40,
                  //       ),
                  //       RaisedButton(
                  //           child: const Text(
                  //             "Admin",
                  //             style: TextStyle(fontSize: 16.5),
                  //           ),
                  //           onPressed: () {
                  //             Navigator.pushReplacementNamed(context, 'alogin');
                  //           }),
                  //     ],
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 250),
                    child: SizedBox(
                      width: 250.0,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                            'Random Chat',
                            textStyle: colorizeTextStyle,
                            colors: colorizeColors,
                          ),
                          ColorizeAnimatedText(
                            'Hoş Geldiniz',
                            textStyle: colorizeTextStyle,
                            colors: colorizeColors,
                          ),
                        ],
                        isRepeatingAnimation: false,
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: SizedBox(
                      width: 250.0,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                            '<< User',
                            textDirection: TextDirection.rtl,
                            textStyle: colorizeTextStyle2,
                            colors: colorizeColors2,
                          ),
                        ],
                        repeatForever: true,
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 270),
                    child: SizedBox(
                      width: 250.0,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                            'Admin >>',
                            textStyle: colorizeTextStyle2,
                            colors: colorizeColors2,
                          ),
                        ],
                        repeatForever: true,
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ),
                  // padding: const EdgeInsets.only(right: 120, left: 90),

                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: const Color.fromARGB(255, 212, 14, 0),
                        child: const Text(
                          "test",
                          style: TextStyle(fontSize: 16.5),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'test');
                        }),
                  ),
                ],
              )),
        ),
      ),
    ));
  }
}
