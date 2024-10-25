import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/networking/internet_checker.dart';
import '../../data/models/login_model.dart';
import '../../data/repo/auth_repo.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;
  InternetCheckerImpl internetChecker;
  final SharedPreferences sharedPreferences;

  SignInCubit({
    required this.authRepo,
    required this.sharedPreferences,
    required this.internetChecker,
  }) : super(const SignInState.initial());

  static SignInCubit get(context) => BlocProvider.of<SignInCubit>(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
    }
  }

  Future<void> clearUserLoginCredentials() async {
    if (sharedPreferences.containsKey('LoginCredentials')) {
      sharedPreferences.remove('LoginCredentials');
    }
  }

  void emitSignInStates() async {
    emit(const SignInState.loading());
    final loginCredentials = LoginModel(
        email: emailController.text, password: passwordController.text);
    if (await internetChecker.isConnected) {
      final response = await authRepo.signIn(loginCredentials);
      response.when(success: (loginModel) {
        emit(SignInState.success(loginModel));
        debugPrint(loginModel.toString());
        saveUserLoginCredentials(loginCredentials);
      }, failure: (error) {
        emit(SignInState.error(error: error.errorModel.message ?? ''));
      });
    } else {
      emit(SignInState.error(error: 'No Internet Connection' ?? ''));
    }
  }
}
