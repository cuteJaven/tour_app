import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
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
        ),
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
