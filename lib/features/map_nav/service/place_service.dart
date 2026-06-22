import 'package:eco_route/models/place_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PlaceService {
  Future<List<PlaceModel>> searchPlace(String query) async {
    final responce = await http.get(
      Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=jsonv2',
      ),
      headers: {'User-Agent': 'EcoRoute'},
    );

    final data = jsonDecode(responce.body);
    return (data as List).map((e) => PlaceModel.fromJson(e)).toList();
  }
}
