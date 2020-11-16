import 'package:flutter/material.dart';
import 'tabs/booking.dart';
import 'tabs/home.dart';
import 'tabs/chats.dart';
import 'tabs/account.dart';

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
    HomeWrapper(),
    BookingWrapper(),
    ChatsWrapper(),
    AccountWrapper(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (x) {
          if (mounted) {
            setState(() {
              this._currentIndex = x;
            });
          }
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
        height: 58,
        width: 58,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.white),
        child: FloatingActionButton(
          backgroundColor: Colors.white70,
          onPressed: () {
            //以后用来发新的帖子
            print('发帖！');
          },
          child: Icon(
            Icons.add,
            color: Colors.lightBlueAccent,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
