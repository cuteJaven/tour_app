import 'package:flutter/material.dart';
import 'package:tour_app/services/auth.dart';

class UserInfoPage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("images/bizhi.jpg"),
          ),
          title: Text("你的名字"),
          subtitle: Text('abc@flutter.com'),
        ),
        ListTile(
          title: Text("我是一个文本"),
        )
      ],
    );
  }
}
