import 'package:flutter/material.dart';
class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('你的名字'),
            accountEmail: Text('abc@flutter.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/bizhi.jpg"),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/fengjing.jpg"), fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.ac_unit),
            ),
            title: Text('风景'),
            onTap: () {

            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.home),
            ),
            title: Text('民宿'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.fastfood),
            ),
            title: Text('美食'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}


