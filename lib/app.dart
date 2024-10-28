import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/core/di/injection.dart';
import 'package:wwalper_app/features/auth/logic/sign-up_provider/sign_up_provider.dart';
import 'package:wwalper_app/features/auth/logic/sign_in_provider/sign_in_provider.dart';
import 'package:wwalper_app/features/favorite/logic/favorite_provider.dart';
import 'package:wwalper_app/features/home/logic/home_provider.dart';
import './core/routing/app_router.dart';
import './core/routing/routes.dart';
import 'core/theming/theme_provider.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 812),
        splitScreenMode: true,
        ensureScreenSize: true,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => getIt<HomeProvider>()),
            ChangeNotifierProvider(
                create: (_) =>
                    getIt<SignInProvider>()..fetchUserLoginCredentials()),
            ChangeNotifierProvider(create: (_) => getIt<SignupProvider>()),
            ChangeNotifierProvider(create: (_) => getIt<PhotosProvider>()),
          ],
          child: ChangeNotifierProvider(
              create: (context) => ThemeProvider(),
              builder: (context, _) {
                final themeProvider = Provider.of<ThemeProvider>(context);
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  themeMode: Provider.of<ThemeProvider>(context).themeMode,
                  theme: MyThemes.lightTheme,
                  darkTheme: MyThemes.darkTheme,
                  // theme: ThemeData(
                  // useMaterial3: false,
                  // scaffoldBackgroundColor: AppColors.whiteColor,
                  // appBarTheme: const AppBarTheme(
                  //   titleSpacing: 0,
                  //   titleTextStyle: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  //   backgroundColor: ColorsManager.mainBlue,
                  //   // titleTextStyle: TextStyles.font15WhiteBold,
                  //   centerTitle: false,
                  //   iconTheme: const IconThemeData(
                  //     color:AppColors.whiteColor
                  //   )
                  // ),
                  // fontFamily: ConstantsText.kAvenir
                  // ),

                  title: "WWLPER",
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  initialRoute: Routes.splashScreen,
                  onGenerateRoute: appRouter.generateRoute,
                );
              }),
        ));
  }
}
