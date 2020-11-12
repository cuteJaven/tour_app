import 'package:flutter/material.dart';
import 'package:helloFlutter/services/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();

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
              Text('请输入账号密码'),
              SizedBox(
                height: 40,
              ),
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
                    final snackBar = SnackBar(
                      content: Text('Succeed!'),
                      action: SnackBarAction(
                        label: '^o^',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    _scaffoldKey.currentState.showSnackBar(snackBar);
                    //Scaffold.of(context).showSnackBar(snackBar);
                    Future.delayed(Duration(seconds: 1), () {
                      Navigator.of(context).pop();
                      print('延时1s执行');
                    });
                  }
                },
              ),
            ],
          ),
        ));
  }
}
