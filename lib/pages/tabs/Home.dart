import 'package:flutter/material.dart';
import 'package:helloFlutter/pages/Home/Food/Food.dart';
import 'package:helloFlutter/pages/Home/GuestHouses/GuestHouse.dart';
import 'package:helloFlutter/pages/Home/Scenery/Scenery.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //backgroundColor: Colors.lightBlueAccent,
        drawerScrimColor: Colors.white,
        key: _scaffoldKey,
        appBar: AppBar(
          /// 通过可监听点击的IconButton传入widget，
          /// 并在onPressed中处理drawer开启，借助于GlobalKey
          leading: new IconButton(
            icon: new Container(
              padding: EdgeInsets.all(3.0),
              child: new CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage("images/bizhi.jpg")),
            ),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
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
              Tab(text: '热门'),
              Tab(text: '关注'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Body(
              index: index,
            ),
            Body2(),
          ],
        ),
        drawer: buildDrawer(context),
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
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
              setState(() {
                index = 0;
                Navigator.pop(context);
              });
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.home),
            ),
            title: Text('民宿'),
            onTap: () {
              setState(() {
                index = 1;
                Navigator.pop(context);
              });
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.fastfood),
            ),
            title: Text('美食'),
            onTap: () {
              setState(() {
                index = 2;
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }
}

class Body extends StatefulWidget {
  final int index;

  Body({this.index = 0});

  @override
  _BodyState createState() => _BodyState(this.index);
}

class _BodyState extends State<Body> {
  int _currentIndex;

  _BodyState(this._currentIndex);

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List _pageList = [SceneryPage(), GuestHousePage(), FoodPage()];

  @override
  Widget build(BuildContext context) {
    return this._pageList[this._currentIndex];
  }
}

class Body2 extends StatefulWidget {
  @override
  _Body2State createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/bizhi.jpg"), fit: BoxFit.cover),
      ),
      child: Text('关注关注关注'),
    );
  }
}
