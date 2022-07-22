// ignore_for_file: unnecessary_string_interpolations, file_names, unused_import, avoid_print, no_leading_underscores_for_local_identifiers, sort_child_properties_last, duplicate_ignore, deprecated_member_use, unused_local_variable, unused_element, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_function_type_syntax_for_parameters

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    maxheight: 1800,
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
var tarih;

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
              return Messagesup(context, stt2, takemessageprovider, onSelect);
            }(context),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: takemessageprovider.usermessage == null
                      ? 0
                      : takemessageprovider.usermessage.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  controller: _controller,
                  itemBuilder: (context, index) {
                    //tarih = takemessageprovider.usermessage[index].tarih;
                    /*Container(
                      child: ListTile(
                          title: Text(takemessageprovider
                              .usermessage[index].tarih
                              .toString())),
                    );*/
                    return GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   deneme = takemessageprovider.usermessage
                        //       .where((element) =>
                        //           element.mesajNo ==
                        //           takemessageprovider
                        //               .usermessage[index].mesajNo)
                        //       .single
                        //       .mesajNo;
                        //   print(ruser);
                        //   print(deneme);
                        //   if (takemessageprovider
                        //           .usermessage[index].messageType !=
                        //       "sender$ruser") {
                        //     setState(() {
                        //       delmessageprovider
                        //           .getdelmessage(deneme.toString());
                        //     });
                        //   } else {
                        //     return null;
                        //   }
                        // });
                      },
                      child: Slidable(
                        startActionPane: ActionPane(
                          // A motion is a widget used to control how the pane animates.
                          motion: const ScrollMotion(),

                          // A pane can dismiss the Slidable.
                          // dismissible: DismissiblePane(onDismissed: () {}),

                          // All actions are defined in the children parameter.
                          children: [
                            // A SlidableAction can have an icon and/or a label.
                            SlidableAction(
                              onPressed: (_) {
                                setState(() {
                                  deneme = takemessageprovider.usermessage
                                      .where((element) =>
                                          element.mesajNo ==
                                          takemessageprovider
                                              .usermessage[index].mesajNo)
                                      .single
                                      .mesajNo;
                                  print(ruser);
                                  print(deneme);
                                  if (takemessageprovider
                                          .usermessage[index].messageType !=
                                      "sender$ruser") {
                                    setState(() {
                                      delmessageprovider
                                          .getdelmessage(deneme.toString());
                                    });
                                  } else {
                                    return null;
                                  }
                                });
                              },
                              foregroundColor: Colors.red,
                              icon: Icons.delete_outline_rounded,
                            ),
                            // SlidableAction(
                            //   onPressed: null,
                            //   backgroundColor: Color(0xFF21B7CA),
                            //   foregroundColor: Colors.white,
                            //   icon: Icons.share,
                            //   label: 'Share',
                            // ),
                          ],
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 0),
                          child: Align(
                            alignment: (takemessageprovider
                                        .usermessage[index].messageType !=
                                    "sender$userinfo"
                                ? Alignment.topLeft
                                : Alignment.topRight),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (takemessageprovider
                                            .usermessage[index].messageType !=
                                        "sender$userinfo"
                                    ? const Color.fromARGB(255, 219, 219, 219)
                                    : const Color.fromARGB(255, 10, 237, 241)),
                              ),
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    takemessageprovider
                                        .usermessage[index].mesaj,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        takemessageprovider
                                            .usermessage[index].saat
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 11,
                                            color: Colors.black54),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
                      const SizedBox(width: 15),
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
                                contentPadding: const EdgeInsets.all(11),
                                hintText: error ? 'hata' : 'Mesaj Yaz',
                                hintStyle:
                                    const TextStyle(color: Colors.white60),
                                filled: true,
                                fillColor: Colors.black,
                                hoverColor: Colors.white),
                            cursorColor: const Color.fromARGB(255, 174, 12, 0),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            validator: (messagess) {
                              if (messagess == null || messagess.isEmpty) {
                                error = true;
                              } else {
                                error = false;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: double.infinity,
                        width: 10,
                      ),
                      FloatingActionButton(
                        onPressed: () async {
                          var hour = DateTime.now().hour.toString();
                          var second = DateTime.now().minute.toString();
                          var day = DateTime.now().day.toString();
                          var month = DateTime.now().month.toString();
                          var year = DateTime.now().year.toString();

                          String monthnew;
                          if (month == "1") {
                            monthnew = "Ocak";
                          }
                          if (month == "2") {
                            monthnew = "Şubat";
                          }
                          if (month == "3") {
                            monthnew = "Mart";
                          }
                          if (month == "4") {
                            monthnew = "Nisan";
                          }
                          if (month == "5") {
                            monthnew = "Mayıs";
                          }
                          if (month == "6") {
                            monthnew = "Haziran";
                          }
                          if (month == "7") {
                            monthnew = "Temmuz";
                          }
                          if (month == "8") {
                            monthnew = "Ağustos";
                          }
                          if (month == "9") {
                            monthnew = "Eylül";
                          }
                          if (month == "10") {
                            monthnew = "Ekim";
                          }
                          if (month == "11") {
                            monthnew = "Kasım";
                          }
                          if (month == "12") {
                            monthnew = "Aralık";
                          }

                          if (formKeym.currentState.validate() &&
                              error == true) {
                            print(error);
                            error = false;
                          } else {
                            print(error);
                            setState(() {
                              sendmessageprovider.getsendmessages(
                                  "$userinfo",
                                  "$ruser",
                                  messages.text,
                                  "$type$userinfo",
                                  ("$hour:$second").toString(),
                                  ("$day $monthnew $year").toString());
                            });

                            setState(() {
                              takemessageprovider.takemessage();
                            });
                            messages.clear();
                            await _scrollDown();
                          }
                        },
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
      ),
    );
  }

  Container Messagesup(BuildContext context, String stt2,
      takemessage_provider takemessageprovider, void onSelect(dynamic item)) {
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
            backgroundImage: AssetImage("lib/pictures/uwp1350290.jpeg"),
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
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
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