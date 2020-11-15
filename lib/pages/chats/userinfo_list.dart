import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/models/userinfo.dart';
import 'package:tour_app/pages/chats/userinfo_tile.dart';

class UserInfoList extends StatefulWidget {
  @override
  _UserInfoListState createState() => _UserInfoListState();
}

class _UserInfoListState extends State<UserInfoList> {
  @override
  Widget build(BuildContext context) {

    final userInfo = Provider.of<List<UserInfo>>(context) ?? [];

    return ListView.builder(
      itemCount: userInfo.length,
      itemBuilder: (context, index) {
        return UserInfoTile(userinfo: userInfo[index]);
      },
    );
  }
}
