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
}


Future<void> fetchHomepageData(ApiConfig apiConfig) async {
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

  final response = await Dio().request(uri.toString(),data: body);
  if (response.statusCode == 200) {
    print('success: ${response.data}');
  } else {
    throw Exception('Failed: ${response.statusCode}');
  }
}

