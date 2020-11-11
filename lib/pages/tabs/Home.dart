import 'package:flutter/material.dart';

import '../Home/Drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tour app'),
          bottom: TabBar(
            //isScrollable: true,
            tabs: [
              Tab(text: '热门'),
              Tab(text: '关注'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Body(),
            Body2(),
          ],
        ),

        drawer: buildDrawer(),
      ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          child: Text('Switch to Search Page'),
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        SizedBox(
          height: 20.0,
        ),
        RaisedButton(
          child: Text('Switch to Scenery Page'),
          onPressed: () {
            Navigator.pushNamed(context, '/product');
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
      ],
    );
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
