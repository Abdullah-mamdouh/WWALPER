import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/core/helpers/extensions/navigator.dart';
import 'package:wwalper_app/core/helpers/spacing.dart';
import 'package:wwalper_app/core/routing/routes.dart';
import 'package:wwalper_app/core/utils/app_assets.dart';

import '../../core/utils/constants.dart';
import '../auth/logic/sign_in_provider/sign_in_provider.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late Timer _timer;

  _goNext() =>
      isLoggedInUser
        ? Future.microtask(() => context.pushReplacementNamed(Routes.managerScreen))
        : Future.microtask(() => context.pushReplacementNamed(Routes.loginScreen));

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 5000), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          child: Image.asset(
            AppAssets.appLogo,
            height: height(context) * 0.5,
          ),
        ),
      ),
    );
  }


}
