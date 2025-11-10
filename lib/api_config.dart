import 'dart:convert';

import 'package:flutter/services.dart';

class ApiConfig {
  final Map<String, String> baseUrls;
  final Map<String, dynamic> endpoints;

  const ApiConfig({
    required this.baseUrls,
    required this.endpoints,
  });

  factory ApiConfig.fromJson(Map<String, dynamic> json) {
    return ApiConfig(
      endpoints: json,
      baseUrls: Map<String, String>.from(json['baseUrls'] ?? {}),
    );
  }

  String _buildUrl(String path) {
    return path.replaceAllMapped(RegExp(r'\{\{(.*?)\}\}'), (match) {
      return baseUrls[match.group(1)] ?? match.group(0)!;
    });
  }

  static Future<ApiConfig> loadFromAssets(String s) async {
    final jsonString = await rootBundle.loadString('assets/configs/api_config.json');
    final jsonData = json.decode(jsonString);
    return ApiConfig.fromJson(jsonData);
  }
  String get homepageData => _buildUrl(endpoints['home']['getHomepageData']);

}