// ignore_for_file: annotate_overrides, library_private_types_in_public_api, avoid_print, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rc_android/GirisEkranlari/LoginUser.dart';
import 'package:rc_android/providers/userstat_provider.dart';

String close;
String pause;
String detac;
String resume;

class AppSystemManager extends StatefulWidget {
  final Widget child;
  AppSystemManager({Key key, this.child}) : super(key: key);

  @override
  _AppSystemManagerState createState() => _AppSystemManagerState();
}

class _AppSystemManagerState extends State<AppSystemManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void didChangeAppLifecycleState(AppLifecycleState state) async {
    var userstatprovider = userstat_provider();

    switch (state) {
      case AppLifecycleState.inactive:
        userstatprovider.getuserstats(statall, stuname, stpass, false);
        print('inactive');
        break;
      case AppLifecycleState.paused:
        userstatprovider.getuserstats(statall, stuname, stpass, false);
        print('paused');
        break;
      case AppLifecycleState.resumed:
        userstatprovider.getuserstats(statall, stuname, stpass, true);
        print('resumed');
        break;
      case AppLifecycleState.detached:
        print('detached');
        userstatprovider.getuserstats(statall, stuname, stpass, false);
        break;
      default:
    }
  }
}
