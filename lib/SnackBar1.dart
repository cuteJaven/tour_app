import 'package:flutter/material.dart';
Function snackBar1(context, scaffoldKey) {
  final GlobalKey<ScaffoldState> _scaffoldKey = scaffoldKey;
  final snackBar = SnackBar(
    content: Text('Succeed!'),
    action: SnackBarAction(
      label: '^o^',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  _scaffoldKey.currentState.showSnackBar(snackBar);
  //Scaffold.of(context).showSnackBar(snackBar);
  Future.delayed(Duration(seconds: 1), () {
    Navigator.of(context).pop();
    print('延时1s执行');
  });
  return null;
}
