import 'package:flutter/material.dart';
class GuestHousePage extends StatefulWidget {
  @override
  _GuestHousePageState createState() => _GuestHousePageState();
}

class _GuestHousePageState extends State<GuestHousePage> {
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
                        'https://cdn.pixabay.com/photo/2017/08/31/06/58/taiwan-2699628_960_720.jpg',
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
                        'https://cdn.pixabay.com/photo/2019/12/03/06/00/ancient-architecture-4669311_960_720.jpg',
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
                        'https://cdn.pixabay.com/photo/2017/04/07/05/49/countryside-2210249_960_720.jpg',
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
                        'https://cdn.pixabay.com/photo/2017/04/07/05/56/countryside-2210268_960_720.jpg',
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
                        'https://cdn.pixabay.com/photo/2017/05/21/17/02/hotel-2331754_960_720.jpg',
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
                        'https://cdn.pixabay.com/photo/2020/04/25/08/42/bed-and-breakfast-5089926_960_720.jpg',
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
