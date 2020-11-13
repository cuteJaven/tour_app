import 'package:flutter/material.dart';
import 'package:tour_app/pages/Account/authenticate/Login.dart';
import 'package:tour_app/pages/Account/authenticate/RegisterFirst.dart';
import 'package:tour_app/pages/Account/authenticate/RegisterSecond.dart';
import 'package:tour_app/pages/Booking/Form.dart';
import 'package:tour_app/pages/Home/Food/Food.dart';
import 'package:tour_app/pages/Home/GuestHouses/GuestHouse.dart';
import 'package:tour_app/pages/Home/Scenery/Scenery.dart';
import 'package:tour_app/pages/Home/Scenery/scenery1.dart';
import 'package:tour_app/pages/Home/Scenery/scenery2.dart';
import 'package:tour_app/pages/Tabs.dart';
import 'package:tour_app/pages/tabs/Home.dart';
import 'package:tour_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/models/user.dart';


final routes = {
  '/': (context) => Tabs(),
  '/home': (context) => HomePage(),
  '/form': (context) => FormPage(),
  '/product': (context) => SceneryPage(),
  '/scenery': (context) => SceneryPage(),
  '/scenery1': (context) => Scenery1Page(),
  '/scenery2': (context) => Scenery2Page(),
  '/food': (context) => FoodPage(),
  '/guest_house': (context) => GuestHousePage(),
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
        builder: (context) => StreamProvider<User>.value(
          value: AuthService().userStream,
          child: pageContentBuilder(context, arguments: settings.arguments),
        ),
      );
    } else {
      return MaterialPageRoute(
        builder: (context) => StreamProvider<User>.value(
          value: AuthService().userStream,
          child: pageContentBuilder(context),
        ),
      );
    }
  }
  //下面这句话仅防报错，没啥用
  return null;
};
