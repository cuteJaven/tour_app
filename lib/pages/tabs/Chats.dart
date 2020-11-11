import 'package:flutter/material.dart';
class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chat Room',
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
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.accessibility),
          ),
          title: Text("好友1"),
          subtitle: Text('你吃饭了吗？'),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.account_circle_rounded),
          ),
          title: Text("好友2"),
          subtitle: Text('大佬7510第二题怎么写啊'),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.agriculture),
          ),
          title: Text("好友3"),
          subtitle: Text('您的外卖到了'),
        ),

      ],
    );
  }
}
