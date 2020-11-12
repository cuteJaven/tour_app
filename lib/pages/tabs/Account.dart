import 'package:flutter/material.dart';
import 'package:helloFlutter/pages/Account/authenticate/authenticate.dart';
import 'package:helloFlutter/models/user.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user= Provider.of<User>(context);
    print(user);

    //return either userinfo or Authenticate widget
    return AuthenticatePage();
  }
}

