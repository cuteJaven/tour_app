import 'package:flutter/material.dart';
import 'package:tour_app/pages/account/authenticate/login.dart';
import 'package:tour_app/pages/account/authenticate/register_first.dart';
import 'package:tour_app/pages/account/authenticate/register_second.dart';
import 'package:tour_app/pages/booking/form.dart';
import 'package:tour_app/pages/home/Food/food.dart';
import 'package:tour_app/pages/home/guest_houses/guest_house.dart';
import 'package:tour_app/pages/home/scenery/scenery.dart';
import 'package:tour_app/pages/home/scenery/scenery1.dart';
import 'package:tour_app/pages/home/scenery/scenery2.dart';
import 'package:tour_app/pages/tabs.dart';
import 'package:tour_app/pages/tabs/home.dart';
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
