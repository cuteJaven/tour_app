import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as Http;

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  List data = [];
  String url = '';
  String time = '';
  String others = '';
  String jsonData = '';
  String result = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Http.get('https://reach-bf00b.firebaseio.com/PostedPic/Food.json')
        .then((resp) {
      result = resp.body;
      setState(() {
        data = json.decode(result);
      });
    }).catchError((e) {
      print('error!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return data.length == 0
        ? Text(
            '请稍后',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 40,
                fontWeight: FontWeight.w600),
          )
        : buildGridView();
  }

  GridView buildGridView() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //每行两列
            childAspectRatio: 1.0 //显示区域宽高相等
            ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  // 边色与边宽度
                  border: Border.all(color: Colors.white38, width: 0.5),
                  image: DecorationImage(
                      image: NetworkImage(data[index]['url']),
                      fit: BoxFit.cover // 填满
                      ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(35.0),
                  ),
                ),
              ),
            ),
            onTap: () {},
          );
        });
  }
}
