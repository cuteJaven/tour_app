import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/models/user.dart';
import 'package:tour_app/pages/account/authenticate/authenticate.dart';
import 'package:tour_app/pages/chats/userinfo_page.dart';

class ChatsWrapper extends StatelessWidget {
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
