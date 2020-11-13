import 'package:flutter/material.dart';
import 'package:tour_app/services/auth.dart';

class RegisterFirstPage extends StatefulWidget {
  @override
  _RegisterFirstPageState createState() => _RegisterFirstPageState();
}

class _RegisterFirstPageState extends State<RegisterFirstPage> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey();

  //text field state
  String email = '';
  String password = '';
  String error = '';
  bool _loading = false;

  Future<Null> _register() async {
    setState(() {
      _loading = !_loading;
    });
    if (_formKey.currentState.validate()) {
      dynamic result =
          await _auth.registerWithEmailAndPassword(email, password);
      if (result == null) {
        setState(() {
          _loading = !_loading;
          error = 'please supply a valid email';
        });
      } else {
        setState(() {
          _loading = !_loading;
          //Navigator.pushNamed(context, '/register2');
          Navigator.of(context).pushReplacementNamed('/register2');
        });
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
        width: 60.0,
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(30)),
        child: FlatButton(
          child: Text('Next'),
          onPressed: () => _register(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                  'Here is the first step of registration, please enter your email'),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
                //若邮箱为空则提示错误(formKey)
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  email = val;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
                obscureText: true,
                //若密码小于6位则提示错误(formKey)
                validator: (val) => val.length < 6
                    ? 'Password must be at least 6 characters long'
                    : null,
                onChanged: (val) {
                  password = val;
                },
              ),
              SizedBox(height: 20.0),

              //这是自定义的可切换widget
              _childLayout(),

              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?  ",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  InkWell(
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          decoration: TextDecoration.underline),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
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
      ),
    );
  }
}
