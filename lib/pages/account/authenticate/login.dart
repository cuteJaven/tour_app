import 'package:flutter/material.dart';
import 'package:tour_app/services/auth.dart';
import 'package:tour_app/shared/constants.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey();

//text field state
  String email = '';
  String password = '';
  String error = '';
  bool _loading = false;

  Future<Null> _register() async {
    if(mounted) {
      setState(() {
        _loading = !_loading;
      });
    }
    if (_formKey.currentState.validate()) {
      dynamic result = await _auth.logIndWithEmailAndPassword(email, password);
      if (result == null) {
        if(mounted) {
          setState(() {
            _loading = !_loading;
            error = 'could not log in with those credentials';
          });
        }
      } else {
        if(mounted) {
          setState(() {
            _loading = !_loading;
          });
        }
        //snackBar1(context, _scaffoldKey);
        //Navigator.pushNamed(context, '/register2');
        Navigator.pop(context);
      }
    }
  }

  Widget _childLayout() {
    if (_loading) {
      return Image(
        image: AssetImage('images/loading1.gif'),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(40)),
        child: FlatButton(
          child: Text(
            'Log in using email',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          onPressed: () async {
            return _register();
          },
        ),
      );
    }
  }

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
          actions: [
            FlatButton(
              child: Text('Log in anon'),
              onPressed: () async {
                // if(mounted) {
                //   setState(() {
                //     _loading = true;
                //   });
                // }

                //匿名登录的功能有待完善，暂时禁用
                //因为有可能返回User或者null，所以是dynamic
                // dynamic result = await _auth.signInAnon();
                // if (result == null) {
                //   print('error logging in');
                // } else {
                //   print('logged in');
                //   print(result.uid);
                //   snackBar1(context, _scaffoldKey);
                //}
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: 'Email'),
                        //若邮箱为空则提示错误(formKey)
                        validator: (val) => val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: 'Password'),

                        //若密码小于6位则提示错误(formKey)
                        validator: (val) => val.length < 6
                            ? 'Password must be at least 6 characters long'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                      SizedBox(height: 10.0),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            child: Text(
                              "Forget password",
                            ),
                          )),
                      SizedBox(height: 20.0),

                      //这是自定义的动态widget
                      _childLayout(),

                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?  ",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          InkWell(
                            child: Text(
                              "Sign Up Free!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  decoration: TextDecoration.underline),
                            ),
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, '/register1');
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
