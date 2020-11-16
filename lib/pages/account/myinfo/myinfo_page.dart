import 'package:flutter/material.dart';
import 'package:tour_app/services/auth.dart';
import 'my_info.dart';
import 'package:tour_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/models/user.dart';

class MyInfoPage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamProvider<UserData>.value(
      value: DatabaseService(uid: user.uid).userDataStream,
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
            ),

          ],
        ),
        body: MyInfo(),
      ),
    );
  }
}
