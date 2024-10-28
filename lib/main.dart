import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import './app.dart';
import './core/di/injection.dart';
// import './core/local/secure_storage/secure_storage.dart';
import './core/routing/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './core/utils/functions/get_mobile_lang.dart';
import 'core/local/shared_preferences/shared_pref_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();

  // await SecureStorage.init();
  await SharedPrefServices.init();
  await EasyLocalization.ensureInitialized();
  // await checkIfLoggedInUser();
  getMobileLang();
  initGetIt();
  await ScreenUtil.ensureScreenSize();

  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'assets/translations',
      startLocale:
      // lang == 'ar' ?
      //  const Locale('ar')
      //  :
      const Locale('en'),
      child: MyApp(
        appRouter: AppRouter(),
      ),
    ),
  );

}
