import 'dart:convert';

import 'package:eco_route/models/aqi_model.dart';
import 'package:http/http.dart' as http;

class AQIService  {
  Future<AQIModel> getAQI({required double lat, required double lon}) async {
    String apiKey = '2586a2c196f7340136a1bc4771b3864f';
    final response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$lon&appid=$apiKey',
      ),
    );
    final data = jsonDecode(response.body);
    return AQIModel.fromJson(data);
  }
}
