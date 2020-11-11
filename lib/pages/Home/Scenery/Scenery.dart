import 'package:flutter/material.dart';

class SceneryPage extends StatefulWidget {
  @override
  _SceneryPageState createState() => _SceneryPageState();
}

class _SceneryPageState extends State<SceneryPage> {
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
                        'https://cdn.pixabay.com/photo/2013/07/18/10/56/railroad-163518_960_720.jpg',
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
                        'https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_960_720.jpg',
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
                        'https://cdn.pixabay.com/photo/2014/08/01/00/08/pier-407252_960_720.jpg',
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
                        'https://cdn.pixabay.com/photo/2013/07/18/20/26/sea-164989_960_720.jpg',
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
                        'https://cdn.pixabay.com/photo/2012/08/06/00/53/bridge-53769_960_720.jpg',
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
                        'https://cdn.pixabay.com/photo/2013/07/25/01/31/forest-166733_960_720.jpg',
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
