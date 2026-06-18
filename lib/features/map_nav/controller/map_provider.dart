import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

final mapProvider = StateNotifierProvider<MapController, bool>(
  (ref) => MapController(),
);

class MapController extends StateNotifier<bool> {
  MapController() : super(false);

  double latitude = 22.3039; // Rajkot Default
  double longitude = 70.8022;

  final fm.MapController internalMapController = fm.MapController();
  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        latitude = 22.3039;
        longitude = 70.8022;

        state = !state;
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        latitude = 22.3039;
        longitude = 70.8022;

        state = !state;
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude = position.latitude;
      longitude = position.longitude;

      internalMapController.move(LatLng(latitude, longitude), 14);

      state = !state;
    } catch (e) {
      debugPrint("Location Error: $e");
    }
  }
}
