import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wwalper_app/core/helpers/extensions/navigator.dart';
import 'package:wwalper_app/core/routing/routes.dart';


class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late Timer _timer;

  _goNext() => context.pushReplacementNamed(Routes.loginScreen) ;
   
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
          child: Column(
            children: [
              Icon(
                Icons.quora_rounded,
                color: Colors.blue[900],
                size: 200,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
