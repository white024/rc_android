// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class InputDecor {
  static InputDecoration inputDecor({
    @required String labeltext,
    @required Icon icon,
  }) {
    return InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2)),
        prefixIcon: icon,
        labelText: labeltext,
        labelStyle: TextStyle(color: Colors.black, fontSize: 19),
        prefixIconColor: Colors.red);
  }
}
