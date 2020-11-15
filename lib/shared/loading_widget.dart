import 'package:flutter/material.dart';


Column loadingWidget() {
  return Column(
    children: [
      Text(
        'Loading...',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 30,
            fontWeight: FontWeight.w600),
      ),
      Container(
          width: 200,
          height: 200,
          child: Image(image: AssetImage('images/loading2.gif'),fit: BoxFit.cover,))
    ],
  );
}