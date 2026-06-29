import 'package:eco_route/models/place_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PlaceService {
  Future<List<PlaceModel>> searchPlace(String query) async {
    final response = await http.get(
      Uri.parse(
        'https://nominatim.openstreetmap.org/search'
        '?q=$query'
        '&format=jsonv2'
        '&countrycodes=in'
        '&limit=10',
      ),
      headers: {'User-Agent': 'EcoRoute/1.0'},
    );

    debugPrint("Status: ${response.statusCode}");
    debugPrint(response.body);

    if (response.statusCode != 200) {
      throw Exception("Request failed");
    }

    final List data = jsonDecode(response.body);

    return data.map((e) => PlaceModel.fromJson(e)).toList();
  }
}
