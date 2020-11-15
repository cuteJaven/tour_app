import 'package:flutter/material.dart';
import 'package:tour_app/models/userinfo.dart';

class UserInfoTile extends StatelessWidget {

  final UserInfo userinfo;
  UserInfoTile({this.userinfo});

  @override
  Widget build(BuildContext context) {
      return Card(
        //margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(userinfo.avatar),
          ),
          title: Text(userinfo.name),
          subtitle: Text(userinfo.description),
        ),
      );
  }
}
