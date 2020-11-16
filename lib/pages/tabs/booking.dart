import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_app/pages/account/authenticate/authenticate.dart';
import 'package:tour_app/pages/booking/booking_page.dart';
import 'package:tour_app/models/user.dart';

class BookingWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either BookingPage or Authenticate widget
    if (user == null) {
      return AuthenticatePage();
    } else {
      return BookingPage();
    }
  }
}
