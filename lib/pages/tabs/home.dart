import 'package:tour_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/pages/account/authenticate/authenticate.dart';
import 'package:tour_app/pages/home/home_page.dart';


class HomeWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either HomePage or Authenticate widget
    if (user == null) {
      return AuthenticatePage();
    } else {
      return HomePage();
    }
  }
}
