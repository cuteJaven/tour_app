import 'package:flutter/material.dart';

class Scenery1Page extends StatelessWidget {
  /// the unique identity of the Scaffold
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text('风景1')),
      body: Body(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}

class Body extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  Body({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/bizhi.jpg"), fit: BoxFit.cover),
      ),
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Text(
              'Who needs some snacks?',
              style: TextStyle(
                  backgroundColor: Color(0x0ffffff),
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Image.network(
              'http://www.comp.hkbu.edu.hk/~mandel/comp7510/images/cat.jpg',
            ),
            Text(
              'http://www.comp.hkbu.edu.hk/~mandel/comp7510/images/cat.jpg',
              style: TextStyle(
                backgroundColor: Color(0x0ffffff),
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            RaisedButton(
                child: new Text('Hit me'),
                onPressed: () {
                  final snackBar = SnackBar(
                    content: Text('Yay! A SnackBar!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  widget.scaffoldKey.currentState.showSnackBar(snackBar);
                  //Scaffold.of(context).showSnackBar(snackBar);
                }),
          ])),
    );
  }
}
