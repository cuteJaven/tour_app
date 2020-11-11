import 'package:flutter/material.dart';

class SceneryPage extends StatefulWidget {
  @override
  _SceneryPageState createState() => _SceneryPageState();
}

class _SceneryPageState extends State<SceneryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The Scenery')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text('Switch to Scenery1'),
            onPressed: () {
              Navigator.pushNamed(context, '/scenery1');
            },
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            child: Text('Switch to Scenery2'),
            onPressed: () {
              Navigator.pushNamed(context, '/scenery2');
            },
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
          ),
        ],
      ),
    );
  }
}
