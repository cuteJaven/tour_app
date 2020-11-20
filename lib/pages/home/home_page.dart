import 'package:flutter/material.dart';
import 'package:tour_app/pages/home/food/food.dart';
import 'package:tour_app/pages/home/guest_houses/guest_house.dart';
import 'package:tour_app/pages/home/scenery/scenery.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/models/user.dart';
import 'package:tour_app/services/database.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamProvider<UserData>.value(
      value: DatabaseService(uid: user.uid).userDataStream,
      child: MyScaffold(),
    );
  }
}

class MyScaffold extends StatefulWidget {
  final int index = 0;

  @override
  _MyScaffoldState createState() => _MyScaffoldState(index);
}

class _MyScaffoldState extends State<MyScaffold> {
  int index;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List _pageList = [SceneryPage(), GuestHousePage(), FoodPage()];

  _MyScaffoldState(this.index);

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          //backgroundColor: Colors.lightBlueAccent,
          drawerScrimColor: Colors.white,
          key: _scaffoldKey,
          appBar: AppBar(
            // 通过可监听点击的IconButton传入widget，
            // 并在onPressed中处理drawer开启，借助于GlobalKey
            leading: FlatButton(
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
              child: userData == null ? Text('') : Text(userData.name),
            ),
            centerTitle: true,
            title: Text(
              'Tour app',
              style: TextStyle(
                  color: Colors.lightBlueAccent, fontWeight: FontWeight.w600),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.ac_unit,
                  color: Colors.lightBlueAccent,
                ),
                onPressed: () {
                  print(index);
                },
              )
            ],
            bottom: TabBar(
              //isScrollable: true,
              labelColor: Colors.lightBlueAccent,
              indicatorColor: Colors.lightBlueAccent,
              unselectedLabelColor: Colors.black38,
              tabs: [
                Tab(text: 'Hot'),
                Tab(text: 'Future'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _pageList[index],
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/bizhi2.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Text('Welcome',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center),
              ),
            ],
          ),
          drawer: Drawer(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserAccountsDrawerHeader(
                  accountName:
                      userData == null ? Text('') : Text(userData.name,style: TextStyle(color: Colors.white),),
                  accountEmail:
                      userData == null ? Text('') : Text(userData.description,style: TextStyle(color: Colors.white),),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: userData == null
                        ? AssetImage("images/bizhi.jpg")
                        : NetworkImage(userData.avatar),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: userData == null
                            ? AssetImage("images/fengjing.jpg")
                            : NetworkImage(userData.backUrl),
                        fit: BoxFit.cover),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.ac_unit),
                  ),
                  title: Text('Scenery'),
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        index = 0;
                        Navigator.pop(context);
                      });
                    }
                  },
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.home),
                  ),
                  title: Text('GuestHouse'),
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        index = 1;
                        Navigator.pop(context);
                      });
                    }
                  },
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.fastfood),
                  ),
                  title: Text('Food'),
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        index = 2;
                        Navigator.pop(context);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
