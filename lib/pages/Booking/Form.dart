import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  String title;
  FormPage({this.title='Form Page'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("I'm Form page"),
          ),
          ListTile(
            title: Text("I'm Form page"),
          ),
          ListTile(
            title: Text("I'm Form page"),
          )
        ],
      ),
    );
  }
}
