import 'package:flutter/material.dart';
class Scenery2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}


class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('风景2')),
      body: Center(
          child: Card(
            color: Color(0xffffffff),
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Time to take a rest ;P',
                        style: TextStyle(
                            backgroundColor: Color(0x0ffffff),
                            color: Color(0xff6600cc),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Image.network(
                        'http://www.comp.hkbu.edu.hk/~mandel/comp7510/images/cake.jpg',
                      ),
                      Text(
                        'http://www.comp.hkbu.edu.hk/~mandel/comp7510/images/cake.jpg',
                        style: TextStyle(
                          backgroundColor: Color(0x0ffffff),
                          color: Color(0xff000000),
                          fontSize: 16,
                        ),
                      )
                    ])),
          )),
    );
  }
}

