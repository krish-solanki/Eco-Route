import 'package:eco_route/features/map_nav/service/place_service.dart';
import 'package:eco_route/models/place_model.dart';
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
  bool recommendedRoute = true;
  bool isReadonly = true;
  final List<PlaceModel> suggestions = [];
  final placeService = PlaceService();
  double destinationLat = 0;
  double destinationLon = 0;

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

  Future<void> getLocation(BuildContext context) async {
    try {
      PermissionStatus status = await Permission.locationWhenInUse.status;
      if (!status.isGranted) {
        status = await Permission.locationWhenInUse.request();
        state = !state;
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      latitude = position.latitude;
      longitude = position.longitude;

      internalMapController.move(LatLng(latitude, longitude), 14);

      state = !state;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> showLocationOptions({required BuildContext context}) async {
    recommendedRoute = false;
    state = !state;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Location'),
          content: const Text('Choose how you want to set your location'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                recommendedRoute = false;
                isReadonly = false;
                state = !state;

                await getLocation(context);
                recommendedRoute = true;
                state = !state;
              },
              child: const Text('Current Location'),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
                recommendedRoute = true;
                isReadonly = false;
                state = !state;
              },
              child: const Text('Manual Location'),
            ),
          ],
        );
      },
    );
  }

  Future<void> searchLocation(String query) async {
    try {
      if (query.isEmpty) return;
      suggestions.clear();
      suggestions.addAll(await placeService.searchPlace(query));
      debugPrint('All Suggections: ${suggestions.toList()}');
      state = !state;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
