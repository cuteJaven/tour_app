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
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    final user = Provider.of<User>(context);

    return StreamProvider<UserData>.value(
      value: DatabaseService(uid: user.uid).userDataStream,
      child: DefaultTabController(
        length: 2,
        child: MyScaffold(_scaffoldKey),
      ),
    );
  }
}

class MyScaffold extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final int index = 0;

  MyScaffold(this._scaffoldKey);

  @override
  _MyScaffoldState createState() => _MyScaffoldState(index);
}

class _MyScaffoldState extends State<MyScaffold> {
  int index;

  _MyScaffoldState(this.index);

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);


    return Scaffold(
      //backgroundColor: Colors.lightBlueAccent,
      drawerScrimColor: Colors.white,
      key: widget._scaffoldKey,
      appBar: AppBar(
        /// 通过可监听点击的IconButton传入widget，
        /// 并在onPressed中处理drawer开启，借助于GlobalKey
        leading: new IconButton(
          icon: new Container(
            padding: EdgeInsets.all(3.0),
            child: new CircleAvatar(
                radius: 30.0, backgroundImage: userData==null?AssetImage("images/bizhi.jpg"):NetworkImage(userData.avatar)),
          ),
          onPressed: () {
            widget._scaffoldKey.currentState.openDrawer();
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
      drawer: buildDrawer(context,userData),
    );
  }

  Drawer buildDrawer(BuildContext context,UserData userData) {
    return Drawer(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserAccountsDrawerHeader(
            accountName: userData==null?Text(''):Text(userData.name),
            accountEmail: userData==null?Text(''):Text(userData.description),
            currentAccountPicture: CircleAvatar(
              backgroundImage: userData==null?AssetImage("images/bizhi.jpg"):NetworkImage(userData.avatar),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: userData==null?AssetImage("images/fengjing.jpg"):NetworkImage(userData.backUrl), fit: BoxFit.cover),
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