class PlaceModel {
  final String name;
  final double lat;
  final double lon;

  PlaceModel({
    required this.name,
    required this.lat,
    required this.lon,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      name: json['display_name'],
      lat: double.parse(json['lat']),
      lon: double.parse(json['lon']),
    );
  }
}