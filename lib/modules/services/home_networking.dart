import 'dart:convert';

import 'package:bogo_home/modules/services/home_models.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import '../../api_config.dart';

class HomeNetworking{


Future<Position> getUserCurrentLocation() async{
  bool serviceEnabled;
  LocationPermission permission;
  late Dio _dio;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {

      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}


Future<HomeData?> fetchHomepageData(ApiConfig apiConfig) async {
  Map<String, dynamic> body = {
    "platform": 'android',
    "limit": 10,
    "offset": 0,
    "city": 'karachi',
    "latitude": '24.8607',
    "longitude": '67.0011',
    "filters": {
      "locationIds": [1,3],
    },
  };
  final url = apiConfig.homepageData;
  final uri = Uri.parse(url);
  print(uri.toString());
  // try{
    final response = await Dio().post(uri.toString(),data: body,);
    if (response.statusCode == 200) {
      final data =response.data;
      Map<String , dynamic> dataMap={
        'banners': data['data']['banners']['banners'],//banners
        'trendingDeals': data['data']['swimlanes'][0]['groupDealEntities'], //trending deals
        'hotDeals': data['data']['swimlanes'][1]['groupDealEntities'], //hot deals
        'groupDeals': data['data']['groupDeals'],// fine dine thingsss
        'categories': data['data']['categories']['categories'],// all food beauty
        'nearbyBrands': data['data']['nearbyEntities']['entities'], //bottom brands
        'featuredBrands': data['data']['featuredEntities']['entities'], //feature store
        'featuredGroupDeal': data['data']['featuredGroupDeal'],// have you had lunch
      };
      print('success:');
      print(data['data']);
      print('featuredGroupDeal');
      print(data['data']['featuredGroupDeal'].runtimeType);
      print('swimlanes');
      print(data['data']['swimlanes'][0]);
      print('nearbyEntities');
      print(data['data']['nearbyEntities']['entities'].runtimeType);
      // print('featuredBrands');
      // print(data['data']['featuredEntities']['entities'].runtimeType);
      // print('groupDeals');
      // print(data['data']['groupDeals']);
      print('categories');
      print(data['data']['categories']['categories']);
        final homeData=HomeData.fromMap(dataMap);
        print(homeData);
      return homeData;
    } else {
      throw Exception('Failed: ${response.statusCode}');
    }
  // }catch(e){
  //   print('Exception here:$e');
  // }
  return null;

}
}



