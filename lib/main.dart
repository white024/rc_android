import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rc_android/Admin/AddUser.dart';
import 'package:rc_android/Admin/UserListA.dart';
import 'package:rc_android/GirisEkranlari/Homes.dart';
import 'package:rc_android/GirisEkranlari/LoginAdmin.dart';
import 'package:rc_android/GirisEkranlari/LoginUser.dart';
import 'package:rc_android/User/MessagesU.dart';
import 'package:rc_android/User/UserListU.dart';
import 'package:rc_android/User/selectimage.dart';
import 'package:rc_android/providers/adduser_provider.dart';
import 'package:rc_android/providers/admin_provider.dart';
import 'package:rc_android/providers/deletemessage_provider.dart';
import 'package:rc_android/providers/deleteuser_provider.dart';
import 'package:rc_android/providers/sendmesage_provider.dart';
import 'package:rc_android/providers/takemessage_provider.dart';
import 'package:rc_android/providers/updateuser_provider.dart';
import 'package:rc_android/providers/uploadimage_provider.dart';
import 'package:rc_android/providers/user_provider.dart';

import 'package:rc_android/providers/userlistu_provider.dart';
import 'package:rc_android/providers/userstat_provider.dart';
import 'package:rc_android/public/stat.dart';
//import 'package:rc_android/GirisEkranlari/LoginAdmin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => admin_provider()),
        ChangeNotifierProvider(create: (_) => user_provider()),
        ChangeNotifierProvider(create: (_) => adduser_provider()),
        ChangeNotifierProvider(create: (_) => delete_provider()),
        ChangeNotifierProvider(create: (_) => updateuser_provider()),
        ChangeNotifierProvider(create: (_) => userlistU_provider()),
        ChangeNotifierProvider(create: (_) => takemessage_provider()),
        ChangeNotifierProvider(create: (_) => sendmessage_provider()),
        ChangeNotifierProvider(create: (_) => userstat_provider()),
        ChangeNotifierProvider(create: (_) => deletemessage_provider()),
        ChangeNotifierProvider(create: (_) => addimage_provider()),
      ],
      child: MaterialApp(
        title: 'Home',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          'alogin': (_) => const LoginAdmin(),
          'adduser': (_) => const AddUser(),
          'ulogin': (_) => const LoginUser(),
          'home': (_) => const Homes(),
          'ulistu': (_) => const UserListU(),
          'alista': (_) => const UserListA(),
          'message': (_) => const MessagesU(),
          'addimage': (_) => const addimage(),
        },
        initialRoute: 'home',
        //login: const LoginAdmin(),
        //home: const LoginAdmin(),
      ),
    );
  }
}
