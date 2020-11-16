import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/models/user.dart';


class MyInfo extends StatefulWidget {

  @override
  _MyInfoState createState() => _MyInfoState();

}

class _MyInfoState extends State<MyInfo> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    return userData == null
        ? Container()
        : ListView(
            children: [
              Container(
                width: double.infinity,
                child: Image.network(userData.backUrl),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundImage:
                      NetworkImage(userData.avatar),
                ),
                title: Text(userData.name),
                subtitle: Text(userData.description),
                trailing: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              )
            ],
          );
  }
}
