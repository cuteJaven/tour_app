import 'package:flutter/material.dart';
import 'package:tour_app/SnackBar1.dart';
import 'package:tour_app/services/auth.dart';

class RegisterSecondPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontWeight: FontWeight.w600,
          ),
        ),
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
  final AuthService _auth = AuthService();

  //text field state
  String code = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Form(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
                'Here is the Second step of registration, please enter the code you received'),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Code",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
              onChanged: (val) {
                code = val;
              },
            ),
            SizedBox(height: 20.0),
            Container(
              alignment: Alignment.center,
              width: 60.0,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: FlatButton(
                child: Text('Next'),
                onPressed: () {
                  //Navigator.pushNamed(context, '/register2');
                  snackBar1(context, widget._scaffoldKey);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
