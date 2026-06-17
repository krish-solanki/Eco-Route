import 'package:flutter_riverpod/flutter_riverpod.dart';

final mapProvider = StateNotifierProvider<MapController, bool>(
  (ref) => MapController(),
);

class MapController extends StateNotifier<bool> {
  MapController() : super(false);

  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));
    state = true;
  }
}
