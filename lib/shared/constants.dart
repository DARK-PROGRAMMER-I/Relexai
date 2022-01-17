 // here we will save constact cariables and functions
 import 'package:flutter/material.dart';

InputDecoration input_decoration_textField(String hint){
  return InputDecoration(
    hintText: hint,
    fillColor: Colors.greenAccent[100],
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black87),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black87)
    )
  );
}