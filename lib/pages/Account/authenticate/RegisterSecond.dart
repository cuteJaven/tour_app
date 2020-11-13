import 'package:flutter/material.dart';
import 'package:helloFlutter/SnackBar1.dart';

class RegisterSecondPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Body(_scaffoldKey),
    );
  }
}

class Body extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  Body(this._scaffoldKey);
  @override
  _BodyState createState() => _BodyState();


}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text('Here is the first step of registration, please enter the code you received'),
          SizedBox(
            height: 40,
          ),
          RaisedButton(
            child: Text('Finished'),
            onPressed: () {
              snackBar1(context, widget._scaffoldKey);
            },
          ),
        ],
      ),
    );
  }
}
