import 'package:flutter/material.dart';
import 'package:tour_app/shared/snack_bar1.dart';
import 'package:tour_app/shared/constants.dart';

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
      body: SingleChildScrollView(child: Body(_scaffoldKey)),
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
              decoration:textInputDecoration.copyWith(hintText: 'Code'),
              onChanged: (val) {
                code = val;
              },
            ),
            SizedBox(height: 20.0),
            Container(
              alignment: Alignment.center,
              width: 70.0,
              padding: EdgeInsets.symmetric(vertical: 3),
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
