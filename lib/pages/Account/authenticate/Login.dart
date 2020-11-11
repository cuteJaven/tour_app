import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Body(),
    );
  }
}
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 40,),
          Text('请输入账号密码'),
          SizedBox(height: 40,),
          RaisedButton(
            child: Text('登录'),
            onPressed: (){
              final snackBar = SnackBar(
                content: Text('登录成功!'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              //widget.scaffoldKey.currentState.showSnackBar(snackBar);
              Scaffold.of(context).showSnackBar(snackBar);
              Future.delayed(Duration(seconds: 1), (){
                Navigator.of(context).pop();
                print('延时1s执行');
              });

            },
          ),
        ],
      ),
    );
  }
}

