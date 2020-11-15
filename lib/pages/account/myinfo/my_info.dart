import 'package:tour_app/models/userinfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyInfo extends StatefulWidget {
  @override
  _MyInfoState createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<List<UserInfo>>(context);

    return userInfo == null
        ? Container()
        : ListView(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(userInfo[0].avatar),
                ),
                title: Text(userInfo[0].name),
                subtitle: Text(userInfo[0].description),
              )
            ],
          );
  }
}
