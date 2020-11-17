import 'package:cached_network_image/cached_network_image.dart';
import 'package:tour_app/services/booking_data.dart';
import 'package:tour_app/models/country_model.dart';
import 'package:tour_app/models/popular_tours_model.dart';
import 'package:tour_app/pages/booking/details.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Booking Now！',
          style: TextStyle(
              color: Colors.lightBlueAccent, fontWeight: FontWeight.w600),
        ),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find the best tour",
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Country",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 240,
              child: FutureBuilder<List<CountryModel>>(
                  future: getCountries(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CountryListTile(
                            label: snapshot.data[index].label,
                            countryName: snapshot.data[index].countryName,
                            noOfTours: snapshot.data[index].noOfTours,
                            rating: snapshot.data[index].rating,
                            imgUrl: snapshot.data[index].imgUrl,
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error);
                    }
                    return Container();
                  }),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Popular Tours",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 16,
            ),
            FutureBuilder<List<PopularTourModel>>(
                future: getPopularTours(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return PopularTours(
                            desc: snapshot.data[index].desc,
                            imgUrl: snapshot.data[index].imgUrl,
                            title: snapshot.data[index].title,
                            price: snapshot.data[index].price,
                            rating: snapshot.data[index].rating,
                            ticketsLeft: snapshot.data[index].ticketsLeft,
                            index: index,
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error);
                  }
                  return Container();
                })
          ],
        ),
      ),
    );
  }
}

class PopularTours extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final String price;
  final double rating;
  final int ticketsLeft;

  //用于标记这是第几个tile
  final int index;

  PopularTours({
    @required this.imgUrl,
    @required this.rating,
    @required this.desc,
    @required this.price,
    @required this.title,
    @required this.ticketsLeft,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(
                      imgUrl: imgUrl,
                      placeName: title,
                      rating: rating,
                      ticketsLeft: ticketsLeft,
                      index: index,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: Color(0xffE9F4F9), borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                width: 110,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff4E6059)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff89A097)),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    price,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff4E6059)),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 10, right: 8),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xff139157)),
                child: Column(
                  children: [
                    Text(
                      "$rating",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class CountryListTile extends StatelessWidget {
  final String label;
  final String countryName;
  final int noOfTours;
  final double rating;
  final String imgUrl;

  CountryListTile(
      {@required this.countryName,
      @required this.label,
      @required this.noOfTours,
      @required this.rating,
      @required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              height: 220,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 200,
            width: 150,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 8, top: 8),
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white38),
                        child: Text(
                          label ?? "New",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              countryName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "$noOfTours Tours",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                        margin: EdgeInsets.only(bottom: 10, right: 8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.white38),
                        child: Column(
                          children: [
                            Text(
                              "$rating",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
