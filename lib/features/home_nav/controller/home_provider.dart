import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeController, bool>(
  (ref) => HomeController(),
);

class HomeController extends StateNotifier<bool> {
  HomeController() : super(false);

  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));

    state = true;
  }
}
