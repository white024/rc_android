// ignore_for_file: unnecessary_string_interpolations, file_names, unused_import, avoid_print, no_leading_underscores_for_local_identifiers, sort_child_properties_last, duplicate_ignore, deprecated_member_use, unused_local_variable, unused_element

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rc_android/GirisEkranlari/LoginUser.dart';
import 'package:rc_android/User/UserListU.dart';
import 'package:rc_android/providers/deletemessage_provider.dart';
import 'package:rc_android/providers/sendmesage_provider.dart';
import 'package:rc_android/providers/takemessage_provider.dart';
import 'package:path/path.dart';
import 'package:rc_android/providers/uploadimage_provider.dart';
import 'package:rc_android/providers/user_provider.dart';
import 'package:rc_android/providers/userlistu_provider.dart';
import 'package:rc_android/providers/userstat_provider.dart';
import 'package:rc_android/public/stat.dart';

class MessagesU extends StatefulWidget {
  const MessagesU({Key key}) : super(key: key);

  @override
  State<MessagesU> createState() => _MessagesUState();
}

var selected;

var myMenuItems = <String>[
  'Profile',
  'slot0',
  'slot1',
];

/*//kamera için
_getFromCamera() async {
  PickedFile pickedFile = await ImagePicker().getImage(
    source: ImageSource.camera,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    File imageFile = File(pickedFile.path);
  }
}*/

var messages = TextEditingController();
final formKeym = GlobalKey<FormState>();
String type = "sender";
bool stc;
bool error = false;
var deneme;
String userr;

class _MessagesUState extends State<MessagesU> {
  @override
  Widget build(BuildContext context) {
    String stt2 = "";
    if (stc == true) {
      stt2 = ("online");
    } else {
      stt2 = ("offline");
    }
    final takemessageprovider = Provider.of<takemessage_provider>(context);
    final sendmessageprovider = Provider.of<sendmessage_provider>(context);
    final delmessageprovider = Provider.of<deletemessage_provider>(context);
    final addimageprovider = Provider.of<addimage_provider>(context);
    final userprovider = Provider.of<user_provider>(context);
    final ScrollController _controller = ScrollController();

    PickedFile pickedFile;
    _getFromGallery() async {
      pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
      }
    }

    void onSelect(item) {
      switch (item) {
        case 'Profile':
          print('Profile clicked');
          Navigator.pushReplacementNamed(context, 'addimage');

          break;
        case 'slot0':
          print('slot0 clicked');
          break;
        case 'slot1':
          print('slot1 clicked');
          break;
      }
    }

    Future _scrollDown() async {
      setState(() {
        takemessageprovider.takemessage();
      });
      _controller.animateTo(_controller.position.maxScrollExtent,
          duration: const Duration(milliseconds: 2950),
          curve: Curves.easeInOut);
    }

    Future.delayed(const Duration(milliseconds: 3000), () async {
      setState(() {
        takemessageprovider.takemessage();
      });
    });

    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, 'ulistu');
        return null;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'ulistu');
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage("lib/pictures/uwp1350290.jpeg"),
                      maxRadius: 20,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "$ruser",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "$stt2",
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          takemessageprovider.takemessage();
                          print(userr);
                        });
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.black54,
                      ),
                    ),
                    PopupMenuButton<String>(
                      onSelected: onSelect,
                      itemBuilder: (BuildContext context) {
                        return myMenuItems.map((String choice) {
                          return PopupMenuItem<String>(
                            child: Text(choice),
                            value: choice,
                          );
                        }).toList();
                      },
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              );
            }(context),
          ),
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: takemessageprovider.usermessage == null
                  ? 0
                  : takemessageprovider.usermessage.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 30, bottom: 90),
              controller: _controller,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      deneme = takemessageprovider.usermessage
                          .where((element) =>
                              element.mesajNo ==
                              takemessageprovider.usermessage[index].mesajNo)
                          .single
                          .mesajNo;
                      print(ruser);
                      print(deneme);
                      if (takemessageprovider.usermessage[index].messageType !=
                          "sender$ruser") {
                        setState(() {
                          delmessageprovider.getdelmessage(deneme.toString());
                        });
                      } else {
                        return null;
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment:
                          (takemessageprovider.usermessage[index].messageType !=
                                  "sender$userinfo"
                              ? Alignment.topLeft
                              : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (takemessageprovider
                                      .usermessage[index].messageType !=
                                  "sender$userinfo"
                              ? Colors.grey.shade200
                              : Color.fromARGB(255, 10, 237, 241)),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          takemessageprovider.usermessage[index].mesaj,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        print("object");
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 174, 12, 0),
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Form(
                        key: formKeym,
                        child: TextFormField(
                          controller: messages,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              contentPadding: EdgeInsets.all(11),
                              hintText: error ? 'hata' : 'Mesaj Yaz',
                              hintStyle: TextStyle(color: Colors.white60),
                              filled: true,
                              fillColor: Colors.black,
                              hoverColor: Colors.white),
                          cursorColor: const Color.fromARGB(255, 174, 12, 0),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          // ignore: missing_return
                          validator: (messagess) {
                            if (messagess == null || messagess.isEmpty) {
                              error = true;
                            } else {
                              error = false;
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () async {
                        if (formKeym.currentState.validate() && error == true) {
                          print(error);
                          error = false;
                        } else {
                          print(error);
                          setState(() {
                            sendmessageprovider.getsendmessages("$userinfo",
                                "$ruser", messages.text, "$type$userinfo");
                          });
                          setState(() {
                            takemessageprovider.takemessage();
                          });
                          messages.clear();
                          await _scrollDown();
                        }
                      },
                      // ignore: sort_child_properties_last
                      child: const Icon(
                        Icons.send,
                        color: Color.fromARGB(255, 174, 12, 0),
                        size: 18,
                      ),
                      backgroundColor: Colors.black,
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



/*return Scaffold(
      body: Container(
        child: const Center(child: const Text("Chat")),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "chat"),
          BottomNavigationBarItem(icon: Icon(Icons.group_work), label: "chat"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "chat"),
        ],
      ),
    );*/