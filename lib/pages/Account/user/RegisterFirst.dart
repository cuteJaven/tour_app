import 'package:flutter/material.dart';

class RegisterFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text('这里是注册的第一步，请输入您的手机号码'),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text('下一步'),
              onPressed: () {

                Navigator.pushNamed(context, '/register2');
                //Navigator.of(context).pushReplacementNamed('/register2');
              },
            ),
          ],
        ),
      ),
    );
  }
}

