class AQIModel {
  final int aqi;
  final double pm25;
  final double pm10;
  final double no2;
  final double o3;

  AQIModel({
    required this.aqi,
    required this.pm25,
    required this.pm10,
    required this.no2,
    required this.o3,
  });

  factory AQIModel.fromJson(Map<String, dynamic> json) {
    return AQIModel(
      aqi: json['list'][0]['main']['aqi'],
      pm25: (json['list'][0]['components']['pm2_5'] as num).toDouble(),
      pm10: (json['list'][0]['components']['pm10'] as num).toDouble(),
      no2: (json['list'][0]['components']['no2'] as num).toDouble(),
      o3: (json['list'][0]['components']['o3'] as num).toDouble(),
    );
  }
}