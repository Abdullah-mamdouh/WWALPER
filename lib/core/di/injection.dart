import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wwalper_app/features/home/data/home_repo.dart';

import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/logic/sign-up_cubit/sign_up_cubit.dart';
import '../../features/auth/logic/sign_in_cubit/sign_in_cubit.dart';
import '../networking/api_service/dio_factory.dart';
import '../networking/internet_checker.dart';

final getIt = GetIt.instance;

void initGetIt() async {
  final firebaseauth = FirebaseAuth.instance;
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(firebaseauth));

  /// Internet Connection Checker
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton(() => InternetCheckerImpl(getIt()));

  /// Register cubit
  getIt.registerFactory(() => SignupCubit(getIt(), getIt()));

  /// create instance from SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  /// login cubit
  getIt.registerFactory(() => SignInCubit(
      internetChecker: getIt(),
      authRepo: getIt(),
      sharedPreferences: sharedPreferences),);

  /// Dio & WallpaperAPI
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<WallpaperApiRepo>(() => WallpaperApiRepo(dio));

  getIt.registerFactory<WallpaperRepo>(() => WallpaperRepo( wallpaperApiRepo: getIt(),));




}
