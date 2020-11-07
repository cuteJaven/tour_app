import 'package:flutter/material.dart';
import 'package:helloFlutter/pages/Tabs.dart';

class RegisterSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
          SizedBox(
            height: 40,
          ),
          Text('这里是注册的第二步，请输入您收到的验证码'),
          SizedBox(
            height: 40,
          ),
          RaisedButton(
            child: Text('下一步'),
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('注册成功!'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              //widget.scaffoldKey.currentState.showSnackBar(snackBar);
              Scaffold.of(context).showSnackBar(snackBar);
              Future.delayed(Duration(seconds: 1), () {
                //Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Tabs(index: 2)),
                    (route) => route == null);
                print('延时1s执行');
              });
            },
          ),
        ],
      ),
    );
  }
}
