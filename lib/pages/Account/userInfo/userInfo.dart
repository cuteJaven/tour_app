import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
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
