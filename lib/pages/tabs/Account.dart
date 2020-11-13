import 'package:flutter/material.dart';
import 'package:tour_app/pages/Account/authenticate/authenticate.dart';
import 'package:tour_app/models/user.dart';
import 'package:tour_app/pages/Account/userInfo/userInfo.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either userinfo or Authenticate widget
    if (user == null) {
      return AuthenticatePage();
    } else {
      return UserInfoPage();
    }
  }
}
