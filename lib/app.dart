import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './core/routing/app_router.dart';
import './core/routing/routes.dart';

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
        child: MaterialApp(
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
        
          title: "Infancia App",
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
