import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/models/userinfo.dart';
import 'package:tour_app/pages/chats/userinfo_list.dart';
import 'package:tour_app/services/database.dart';


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
    return StreamProvider<List<UserInfo>>.value(
    value: DatabaseService().userInfo,
    child:UserInfoList()
    );
  }
}
