
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wwalper_app/core/helpers/extensions/navigator.dart';
import 'package:wwalper_app/core/routing/routes.dart';

import '../../../../core/networking/internet_checker.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_show_toast.dart';
import '../../data/models/login_model.dart';
import '../../data/models/register_model.dart';
import '../../data/repo/auth_repo.dart';

class SignupProvider extends ChangeNotifier {
  final AuthRepo authRepo;
  final InternetCheckerImpl internetChecker;

  SignupProvider({required this.authRepo, required this.internetChecker});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignupState _state = SignupState.initial();
  SignupState get state => _state;

  Future<SharedPreferences> getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> saveUserLoginCredentials(LoginModel loginCredentials) async {
    final preferences = await getPreferences();
    preferences.setString(
        'LoginCredentials', jsonEncode(loginCredentials.toJson()));
  }

  void setSignupState(SignupState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> emitSignupStates(BuildContext context) async {
    setSignupState(SignupState.loading());

    if (await internetChecker.isConnected) {
      final response = await authRepo.signUp(RegisterModel(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          passwordConfirmation: passwordConfirmationController.text));
      response.when(success: (registerModel) {
        setSignupState(SignupState.success(registerModel));
        saveUserLoginCredentials(LoginModel(email: emailController.text, password: passwordController.text));
        showToast(text: AppStrings.registerSuccessfullKey, state: ToastStates.success);
        context.pushReplacementNamed(Routes.loginScreen);
        }, failure: (error) {
        setSignupState(SignupState.error(error: error.errorModel.message ?? ''));
      });
    } else {
      setSignupState(SignupState.error(error: 'No Internet Connection'));
      showToast(text: 'No Internet Connection', state: ToastStates.warning);
    }
  }
}

class SignupState<T> {
  final T? data;
  final String? error;
  final bool isLoading;
  final bool isInitial;

  const SignupState._({
    this.data,
    this.error,
    this.isLoading = false,
    this.isInitial = false,
  });

  const SignupState.initial() : this._(isInitial: true);
  const SignupState.loading() : this._(isLoading: true);
  const SignupState.success(T data) : this._(data: data);
  const SignupState.error({required String error}) : this._(error: error);
}

/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/networking/internet_checker.dart';
import '../../data/models/login_model.dart';
import '../../data/models/register_model.dart';
import '../../data/repo/auth_repo.dart';
import 'sign_up_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo _authRepo;
  final InternetCheckerImpl internetChecher;
  SignupCubit(this._authRepo, this.internetChecher) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<SharedPreferences> getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> saveUserLoginCredentials(LoginModel loginCredentials) async {
    final preferences = await getPreferences();
    preferences.setString(
        'LoginCredentials', jsonEncode(loginCredentials.toJson()));
  }

  void emitSignupStates() async {
    emit(const SignupState.loading());
    if(await internetChecher.isConnected){
      final response = await _authRepo.signUp(RegisterModel(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          passwordConfirmation: passwordConfirmationController.text));
      response.when(success: (registerModel) {
        emit(SignupState.success(registerModel));
        saveUserLoginCredentials(LoginModel(email: emailController.text, password: passwordController.text));
        //debugPrint(registerModel.toString());
      }, failure: (error) {
        emit(SignupState.error(error: error.errorModel.message ?? ''));
      });
    }
    else {
      emit(SignupState.error(error: 'No Internet Connection'));
    }
  }


}
*/