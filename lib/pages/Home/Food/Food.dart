import 'package:flutter/material.dart';
class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //横轴两个子widget
            childAspectRatio: 1.0 //宽高比为1时，子widget
        ),
        children: <Widget>[
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white38, width: 0.5),
                  // 边色与边宽度
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2016/12/26/17/28/food-1932466_960_720.jpg',
                      ),
                      fit: BoxFit.cover // 填满
                  ),

                  borderRadius: BorderRadius.all(
                    Radius.circular(35.0),
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white38, width: 0.5),
                  // 边色与边宽度
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_960_720.jpg',
                      ),
                      fit: BoxFit.cover // 填满
                  ),
                  borderRadius: BorderRadius.circular((20.0)),
                ),
              ),
            ),
            onTap: () {},
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white38, width: 0.5),
                  // 边色与边宽度
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_960_720.jpg',
                      ),
                      fit: BoxFit.cover // 填满
                  ),
                  borderRadius: BorderRadius.circular((20.0)),
                ),
              ),
            ),
            onTap: () {},
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white38, width: 0.5),
                  // 边色与边宽度
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg',
                      ),
                      fit: BoxFit.cover // 填满
                  ),
                  borderRadius: BorderRadius.circular((20.0)),
                ),
              ),
            ),
            onTap: () {},
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white38, width: 0.5),
                  // 边色与边宽度
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2016/02/05/15/34/pasta-1181189_960_720.jpg',
                      ),
                      fit: BoxFit.cover // 填满
                  ),
                  borderRadius: BorderRadius.circular((20.0)),
                ),
              ),
            ),
            onTap: () {},
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white38, width: 0.5),
                  // 边色与边宽度
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2018/05/01/18/21/eclair-3366430_960_720.jpg',
                      ),
                      fit: BoxFit.cover // 填满
                  ),
                  borderRadius: BorderRadius.circular((20.0)),
                ),
              ),
            ),
            onTap: () {},
          ),
        ]);
  }
}
