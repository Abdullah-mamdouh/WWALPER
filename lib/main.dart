import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/core/helpers/extensions/navigator.dart';
import 'package:wwalper_app/features/auth/logic/sign_in_provider/sign_in_provider.dart';
import './app.dart';
import './core/di/injection.dart';
import './core/local/secure_storage/secure_storage.dart';
import './core/routing/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/utils/constants.dart';
import 'firebase_options.dart';
import './core/utils/functions/get_mobile_lang.dart';
import 'core/local/shared_preferences/shared_pref_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();

  await SecureStorage.init();
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
