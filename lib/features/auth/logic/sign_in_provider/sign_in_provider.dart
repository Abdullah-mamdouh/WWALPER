import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/networking/internet_checker.dart';
import '../../../../core/utils/constants.dart';
import '../../data/models/login_model.dart';
import '../../data/repo/auth_repo.dart';
import 'sign_in_state.dart';


class SignInProvider extends ChangeNotifier {
  final AuthRepo authRepo;
  final InternetCheckerImpl internetChecker;
  final SharedPreferences sharedPreferences;

  SignInProvider({
    required this.authRepo,
    required this.sharedPreferences,
    required this.internetChecker,
  });

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignInState _state = SignInState.initial();
  SignInState get state => _state;

  void _setState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> saveUserLoginCredentials(LoginModel loginCredentials) async {
    await sharedPreferences.setString(
        'LoginCredentials', jsonEncode(loginCredentials.toJson()));
  }

  Future<void> fetchUserLoginCredentials() async {
    if (sharedPreferences.getString('LoginCredentials') != null) {
      final fetchedLoginCredentials = LoginModel.fromJson(
        jsonDecode(sharedPreferences.getString('LoginCredentials')!),
      );
      emailController.text = fetchedLoginCredentials.email;
      passwordController.text = fetchedLoginCredentials.password;
      isLoggedInUser = true;

    }else {
      emailController.clear();
      passwordController.clear();
      isLoggedInUser = false;
    }
    notifyListeners();
  }

  Future<void> clearUserLoginCredentials() async {
    if (sharedPreferences.containsKey('LoginCredentials')) {
      sharedPreferences.remove('LoginCredentials');
      emailController.clear();
      passwordController.clear();
      isLoggedInUser = false;
      notifyListeners();
    }
  }

  Future<void> emitSignInStates() async {
    _setState(SignInState.loading());
    final loginCredentials = LoginModel(
        email: emailController.text, password: passwordController.text);
    if (await internetChecker.isConnected) {
      final response = await authRepo.signIn(loginCredentials);
      response.when(
        success: (loginModel) {
          _setState(SignInState.success(loginModel));
          saveUserLoginCredentials(loginCredentials);
        },
        failure: (error) {
          _setState(SignInState.error(error: error.errorModel.message ?? ''));
        },
      );
    } else {
      _setState(SignInState.error(error: 'No Internet Connection'));
    }
  }
}