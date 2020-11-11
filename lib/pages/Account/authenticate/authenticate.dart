import 'package:flutter/material.dart';
class AuthenticatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Account',
          style:
          TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.w600),),
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
    return ListView(
      children: [
        RaisedButton(
          child: Text('转跳到登录页面'),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          child: Text('转跳到注册页面'),
          onPressed: () {
            Navigator.pushNamed(context, '/register1');
          },
        ),
      ],
    );
  }
}

