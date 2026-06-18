import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider = StateNotifierProvider<ProfileController, bool>(
  (ref) => ProfileController(),
);

class ProfileController extends StateNotifier<bool> {
  ProfileController() : super(false);
}
