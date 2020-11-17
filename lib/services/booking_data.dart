import 'package:tour_app/models/country_model.dart';
import 'package:tour_app/models/popular_tours_model.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';

Future<List<CountryModel>> getCountries() async {
  List<CountryModel> country = new List();
  //用于接收http.get的数据
  List dataList = [];
  //Map<String,dynamic> dataMap={};
  try {
    Http.Response resp = await Http.get(
        'https://reach-bf00b.firebaseio.com/Booking/Countries.json');
    String result = resp.body;
    dataList = json.decode(result);
    dataList.map((e) {
      CountryModel countryModel = new CountryModel();
      countryModel.countryName = e['countryName'];
      countryModel.label = e['label'];
      countryModel.noOfTours = e['noOfTours'];
      countryModel.rating = e['rating'];
      countryModel.imgUrl = e['imgUrl'];
      country.add(countryModel);
    }).toString();
  } catch (e) {
    print(e.toString());
  }
  return country;
}

Future<List<PopularTourModel>> getPopularTours() async {
  List<PopularTourModel> popularTourModels = new List();

  //用于接收http.get的数据
  List dataList = [];
  //Map<String,dynamic> dataMap={};
  try {
    Http.Response resp = await Http.get(
        'https://reach-bf00b.firebaseio.com/Booking/PopularTour.json');
    String result = resp.body;
    dataList = json.decode(result);
    dataList.map((e) {
      PopularTourModel popularTourModel = new PopularTourModel();
      popularTourModel.title = e['title'];
      popularTourModel.desc = e['desc'];
      popularTourModel.price = e['price'];
      popularTourModel.rating = e['rating'];
      popularTourModel.imgUrl = e['imgUrl'];
      popularTourModel.ticketsLeft = e['ticketsLeft'];
      popularTourModels.add(popularTourModel);
    }).toString();
  } catch (e) {
    print(e.toString());
  }
  return popularTourModels;
}
