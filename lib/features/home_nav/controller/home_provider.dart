import 'package:eco_route/features/home_nav/service/air_quality_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final homeProvider = StateNotifierProvider<HomeController, bool>(
  (ref) => HomeController(),
);

class HomeController extends StateNotifier<bool> {
  HomeController() : super(false);

  final AQIService service = AQIService();

  String selectedCity = "Rajkot";

  int aqi = 0;
  double pm25 = 0;
  double pm10 = 0;
  double no2 = 0;
  double o3 = 0;

  final Map<String, Map<String, double>> cities = {
    "Rajkot": {"lat": 22.3039, "lon": 70.8022},
    "Ahmedabad": {"lat": 23.0225, "lon": 72.5714},
    "Surat": {"lat": 21.1702, "lon": 72.8311},
    "Vadodara": {"lat": 22.3072, "lon": 73.1812},
    "Mumbai": {"lat": 19.0760, "lon": 72.8777},
    "Delhi": {"lat": 28.6139, "lon": 77.2090},
    "Bangalore": {"lat": 12.9716, "lon": 77.5946},
    "Pune": {"lat": 18.5204, "lon": 73.8567},
  };

  Future<void> initializeApp() async {
    await fetchAQIForSelectedCity();
    state = !state;
  }

  Future<void> fetchAQIForSelectedCity() async {
    try {
      final lat = cities[selectedCity]!["lat"]!;
      final lon = cities[selectedCity]!["lon"]!;

      final result = await service.getAQI(lat: lat, lon: lon);

      aqi = result.aqi;
      pm25 = result.pm25;
      pm10 = result.pm10;
      no2 = result.no2;
      o3 = result.o3;

      state = !state;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void showCityName(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            width: 300.w,
            height: 350.h,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Text(
                    'Select City',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      final cityName = cities.keys.elementAt(index);

                      return ListTile(
                        title: Text(cityName),
                        onTap: () async {
                          selectedCity = cityName;

                          Navigator.pop(context);

                          await fetchAQIForSelectedCity();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String getAQIStatus(int aqi) {
    switch (aqi) {
      case 1:
        return 'Good';
      case 2:
        return 'Fair';
      case 3:
        return 'Moderate';
      case 4:
        return 'Poor';
      case 5:
        return 'Very Poor';
      default:
        return 'Unknown';
    }
  }
}
