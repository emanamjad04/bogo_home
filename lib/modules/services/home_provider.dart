import 'package:bogo_home/api_config.dart';
import 'package:bogo_home/modules/services/home_models.dart';
import 'package:bogo_home/modules/services/home_networking.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier{
  HomeNetworking _homeNetworking =HomeNetworking();
  HomeData? get homeData => _homeData;
  HomeData? _homeData;

  Future<void> getHomeData(ApiConfig apiConfig) async{
    try{
      _homeData =await _homeNetworking.fetchHomepageData(apiConfig);

    }
    catch(e){
      print('exception: $e');
    }
  }


}