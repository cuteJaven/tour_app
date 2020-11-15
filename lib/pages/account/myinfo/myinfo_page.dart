import 'package:flutter/material.dart';
import 'package:tour_app/models/userinfo.dart';
import 'package:tour_app/services/auth.dart';
import 'my_info.dart';
import 'package:tour_app/services/database.dart';
import 'package:provider/provider.dart';

class UserInfoPage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserInfo>>.value(
      value: DatabaseService().userInfo,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Account',
            style: TextStyle(
                color: Colors.lightBlueAccent, fontWeight: FontWeight.w600),
          ),
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.exit_to_app),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: MyInfo(),
      ),
    );
  }
}
