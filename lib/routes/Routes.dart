import 'package:flutter/material.dart';
import 'package:helloFlutter/pages/Account/user/Login.dart';
import 'package:helloFlutter/pages/Account/user/RegisterFirst.dart';
import 'package:helloFlutter/pages/Account/user/RegisterSecond.dart';
import 'package:helloFlutter/pages/Booking/Form.dart';
import 'package:helloFlutter/pages/Home/Scenery/Scenery.dart';
import 'package:helloFlutter/pages/Home/Scenery/scenery1.dart';
import 'package:helloFlutter/pages/Home/Scenery/scenery2.dart';
import 'package:helloFlutter/pages/Home/Search.dart';
import 'package:helloFlutter/pages/Tabs.dart';


final routes = {
  '/': (context) => Tabs(),
  '/form': (context) => FormPage(),
  '/search': (context) => SearchPage(),
  '/product': (context) => SceneryPage(),
  '/scenery1': (context) => Scenery1Page(),
  '/scenery2': (context) => Scenery2Page(),
  '/login': (context) => LoginPage(),
  '/register1': (context) => RegisterFirstPage(),
  '/register2': (context) => RegisterSecondPage(),
};

Function onGenerateRoute = (settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      return MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
    } else {
      return MaterialPageRoute(
          builder: (context) => pageContentBuilder(context));
    }
  }
  //下面这句话仅防报错，没啥用
  return MaterialPageRoute(builder: (context) => pageContentBuilder(context));
};
