import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

final mapProvider = StateNotifierProvider<MapController, bool>(
  (ref) => MapController(),
);

class MapController extends StateNotifier<bool> {
  MapController() : super(false);

  double latitude = 22.3039;
  double longitude = 70.8022;

  final fm.MapController internalMapController = fm.MapController();
  Future<void> getCurrentLocation() async {
    try {
      // bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      // if (!serviceEnabled) {
      // latitude = 22.3039;
      // longitude = 70.8022;

      // state = !state;
      // return;
      // }

      // LocationPermission permission = await Geolocator.checkPermission();

      // if (permission == LocationPermission.denied) {
      //   permission = await Geolocator.requestPermission();
      // }

      // if (permission == LocationPermission.denied ||
      //     permission == LocationPermission.deniedForever) {
      //   latitude = 22.3039;
      //   longitude = 70.8022;

      //   state = !state;
      //   return;
      // }

      // Position position = await Geolocator.getCurrentPosition(
      //   locationSettings: const LocationSettings(
      //     accuracy: LocationAccuracy.high,
      //   ),
      // );

      // latitude = position.latitude;
      // longitude = position.longitude;
      internalMapController.move(LatLng(latitude, longitude), 14);
      state = !state;
    } catch (e) {
      debugPrint("Location Error: $e");
    }
  }

  Future<void> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    PermissionStatus status = await Permission.locationWhenInUse.request();

    if (!status.isGranted) {
      debugPrint('Location permission denied');
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    latitude = position.latitude;
    longitude = position.longitude;

    debugPrint('Latitude: $latitude');
    debugPrint('Longitude: $longitude');

    internalMapController.move(LatLng(latitude, longitude), 14);

    state = !state;
  }

  Future<void> showLocationOptions({required BuildContext context}) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Location'),
          content: const Text('Choose how you want to set your location'),
          actions: [
            TextButton(
              onPressed: () async {
                await getLocation();
                Navigator.pop(context);
              },
              child: const Text('Current Location'),
            ),
            TextButton(onPressed: null, child: const Text('Manual Location')),
          ],
        );
      },
    );
  }
}
