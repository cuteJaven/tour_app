import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintStyle: TextStyle(color: Colors.grey),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent),
  ),
  enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  filled: true,
  fillColor: Colors.white,
);

const boxInputDecoration = InputDecoration(
  hintStyle: TextStyle(color: Colors.grey),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent),
  ),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  filled: true,
  fillColor: Colors.white,
);
