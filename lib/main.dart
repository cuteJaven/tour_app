import 'package:flutter/material.dart';
import 'package:helloFlutter/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: Tabs(),
        initialRoute: '/',
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateRoute: onGenerateRoute);
  }
}
