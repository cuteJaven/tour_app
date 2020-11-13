import 'package:flutter/material.dart';
import 'package:tour_app/services/auth.dart';

class RegisterFirstPage extends StatefulWidget {

  @override
  _RegisterFirstPageState createState() => _RegisterFirstPageState();
}

class _RegisterFirstPageState extends State<RegisterFirstPage> {
  final AuthService _auth =  AuthService();


  //text field state
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text('Here is the first step of registration, please enter your email'),
              SizedBox(
                height: 40,
              ),
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
                child: Text('Next'),
                onPressed: () {
                  //Navigator.pushNamed(context, '/register2');
                  Navigator.of(context).pushReplacementNamed('/register2');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

