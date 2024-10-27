import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wwalper_app/features/favorite/data/local_data_repo.dart';
import 'package:wwalper_app/features/favorite/logic/favorite_provider.dart';
import 'package:wwalper_app/features/home/data/home_repo.dart';
import 'package:wwalper_app/features/home/logic/home_provider.dart';

import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/logic/sign-up_provider/sign_up_provider.dart';
import '../../features/auth/logic/sign_in_provider/sign_in_provider.dart';
import '../../features/home/data/models/wallpaper_model.dart';
import '../networking/api_service/dio_factory.dart';
import '../networking/internet_checker.dart';

final getIt = GetIt.instance;

void initGetIt() async {
  final firebaseauth = FirebaseAuth.instance;
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(firebaseauth));

  Hive.registerAdapter(PhotosAdapter());
  Hive.registerAdapter(SrcAdapter());
  await Hive.openBox<Photos>('favorite_photos');

  /// Internet Connection Checker
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton(() => InternetCheckerImpl(getIt()));

  /// Register provider
  getIt.registerFactory<SignupProvider>(() => SignupProvider(internetChecker: getIt(), authRepo: getIt(),));

  /// create instance from SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  /// login provider
  getIt.registerFactory<SignInProvider>(() => SignInProvider(
      internetChecker: getIt(),
      authRepo: getIt(),
      sharedPreferences: sharedPreferences),);

  /// Dio & WallpaperAPI
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<WallpaperApiRepo>(() => WallpaperApiRepo(dio));

  getIt.registerFactory<WallpaperRepo>(() => WallpaperRepo( wallpaperApiRepo: getIt(),));
  /// Home Cubit
  getIt.registerFactory<HomeProvider>(() => HomeProvider( internetChecker: getIt(), wallpaperRepo: getIt()));

  getIt.registerLazySingleton<LocalData>(() => LocalData());
  getIt.registerFactory<PhotosProvider>(() => PhotosProvider( localData: getIt()));



}
