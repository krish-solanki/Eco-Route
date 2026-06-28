import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyProvider = StateNotifierProvider<HistoryController, bool>(
  (ref) => HistoryController(),
);

class HistoryController extends StateNotifier<bool> {
  HistoryController() : super(false);
  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));

    state = true;
  }

  Future<void> getUserDetails() async{
    
  }
}
