import 'package:flutter/material.dart';
import 'package:tour_app/services/auth.dart';
import '../../../SnackBar1.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();

//text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'Login',
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Column(
            children: [
              RaisedButton(
                child: Text('Log in anon'),
                onPressed: () async {
                  //因为有可能返回User或者null，所以是dynamic
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print('error logging in');
                  } else {
                    print('logged in');
                    print(result.uid);
                    snackBar1(context, _scaffoldKey);
                  }
                },
              ),
              Form(
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    TextFormField(
                      onChanged: (val) {
                          email = val;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      obscureText: true,
                      onChanged: (val) {
                          password = val;
                      },
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.lightBlueAccent,
                      child: Container(
                        height: 40.0,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'Log in using email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        print(email);
                        print(password);

                        snackBar1(context, _scaffoldKey);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}


