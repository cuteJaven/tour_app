import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:tour_app/services/booking_data.dart';
import 'package:tour_app/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';

class Details extends StatefulWidget {
  final String imgUrl;
  final String placeName;
  final double rating;
  final int ticketsLeft;

  //用来标记这是第几个tile
  final int index;

  Details({
    @required this.rating,
    @required this.imgUrl,
    @required this.placeName,
    @required this.ticketsLeft,
    @required this.index,
  });

  @override
  _DetailsState createState() => _DetailsState(ticketsLeft);
}

class _DetailsState extends State<Details> {
  int ticketsLeft;
  _DetailsState(this.ticketsLeft);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.imgUrl,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 350,
                    color: Colors.black12,
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Image.asset(
                                "images/heart.png",
                                height: 24,
                                width: 24,
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.placeName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 23),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.white70,
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Please authorize positioning",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      RatingBar(widget.rating.round()),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "${widget.rating}",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text('Tickets Left:$ticketsLeft',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  RaisedButton(
                                    child: Text('Booking'),
                                    onPressed: () async {
                                      //更新服务器中剩余票数量,用index定位到指定路径
                                      //按一次减一
                                      ticketsLeft--;
                                      try {
                                        print(widget.index);
                                        await Http.put(
                                          'https://reach-bf00b.firebaseio.com/Booking/PopularTour/${widget.index}/ticketsLeft.json',
                                          body: json.encode(ticketsLeft),
                                        );
                                      } catch (e) {
                                        print(e.toString());
                                      }
                                      setState(() {});
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          height: 50,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FeaturesTile(
                    icon: Icon(Icons.wifi, color: Color(0xff5A6C64)),
                    label: "Free Wi-Fi",
                  ),
                  FeaturesTile(
                    icon: Icon(Icons.beach_access, color: Color(0xff5A6C64)),
                    label: "Sand Beach",
                  ),
                  FeaturesTile(
                    icon: Icon(Icons.card_travel, color: Color(0xff5A6C64)),
                    label: "First Coastline",
                  ),
                  FeaturesTile(
                    icon: Icon(Icons.local_drink, color: Color(0xff5A6C64)),
                    label: "bar and Restaurant",
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [DetailsCard(), DetailsCard()],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "The tour will begin outside the legendary Molina Rouge windmill. Together with your guide, you'll head to the Montfort district, where you'll have the opportunity to take photos of the former homes of artists like Van Gogh, Renoir and Picasso.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff879D95)),
                ),
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
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ImageListTile(
                                imgUrl: snapshot.data[index].imgUrl,
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error);
                      }
                      return Container();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  final String title;
  final String noOfReviews;
  final double rating;

  DetailsCard({this.rating, this.title, this.noOfReviews});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Color(0xffE9F4F9), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color(0xffD5E6F2),
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  "images/card1.png",
                  height: 30,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Booking",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff5A6C64)),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "8.0/10",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff5A6C64)),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            " Based on 30 reviews",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff879D95)),
          ),
        ],
      ),
    );
  }
}

class FeaturesTile extends StatelessWidget {
  final Icon icon;
  final String label;

  FeaturesTile({this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff5A6C64).withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(40)),
              child: icon,
            ),
            SizedBox(
              height: 9,
            ),
            Container(
                width: 70,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff5A6C64)),
                ))
          ],
        ),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int rating;

  RatingBar(this.rating);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: rating >= 1 ? Colors.white70 : Colors.white30,
        ),
        SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating >= 2 ? Colors.white70 : Colors.white30,
        ),
        SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating >= 3 ? Colors.white70 : Colors.white30,
        ),
        SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating >= 4 ? Colors.white70 : Colors.white30,
        ),
        SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating >= 5 ? Colors.white70 : Colors.white30,
        ),
      ],
    ));
  }
}

class ImageListTile extends StatelessWidget {
  final String imgUrl;

  ImageListTile({@required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          height: 220,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
