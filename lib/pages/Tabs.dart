import 'package:flutter/material.dart';
import 'tabs/Booking.dart';
import 'tabs/Home.dart';
import 'tabs/Chats.dart';
import 'tabs/Account.dart';

class Tabs extends StatefulWidget {
  final int index;

  Tabs({this.index = 0});

  @override
  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex;

  _TabsState(this._currentIndex);

  List _pageList = [
    HomePage(),
    BookingPage(),
    ChatsPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (x) {
          setState(() {
            this._currentIndex = x;
          });
        },
        iconSize: 45.0,
        unselectedItemColor: Colors.black38,
        fixedColor: Colors.lightBlueAccent,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Account',
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.white),
        child: FloatingActionButton(
          backgroundColor: Colors.white38,
          focusColor: Colors.lightBlueAccent,
          onPressed: () {
            //以后用来发新的帖子
            print('发帖！');
          },
          child: Icon(Icons.add,color: Colors.lightBlueAccent,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
