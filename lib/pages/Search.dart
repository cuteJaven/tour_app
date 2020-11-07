import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final arguments;

  SearchPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("I'm searchPage"),
      ),
      body: Column(
        children: [
          Text('这里是内容'),
          RaisedButton(
            onPressed: () {
              // print(args);
            },
            child: Text('${arguments != null ? arguments['id'] : '0'}'),
          )
        ],
      ),
    );
  }
}
