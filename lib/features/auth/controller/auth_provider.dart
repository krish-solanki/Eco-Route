import 'package:eco_route/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthController, UserModel?>(
  (ref) => AuthController(),
);

class AuthController extends StateNotifier<UserModel?> {
  AuthController() : super(null) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        state = null;
      } else {
        loadUser();
      }
    });
  }
  Future<void> loadUser() async{
    
  }
}

