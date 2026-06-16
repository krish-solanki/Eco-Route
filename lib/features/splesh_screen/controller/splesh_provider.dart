import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashProvider = StateNotifierProvider<SplashController, bool>(
  (ref) => SplashController(),
);

class SplashController extends StateNotifier<bool> {
  SplashController() : super(false);

  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));

    state = true;
  }
}
