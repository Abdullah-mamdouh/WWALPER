import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/app.dart';
import 'package:wwalper_app/core/helpers/extensions/navigator.dart';
import 'package:wwalper_app/core/routing/routes.dart';
import 'package:wwalper_app/core/theming/styles.dart';
import 'package:wwalper_app/core/widgets/app_text_button.dart';
import 'package:wwalper_app/core/widgets/custom_show_toast.dart';
import 'package:wwalper_app/features/auth/logic/sign_in_provider/sign_in_provider.dart';
import 'package:wwalper_app/features/home/logic/home_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.w,
        height: 56.h,
        child: BouncingButton(
          child: Text(
            'LogOut',
            style: TextStyles.font20BlackBold,
          ),
          onPress: () => showCustomDialog(
              context: context,
              msg: "Do You want to LogOut",
              onTap: () async {
                // context.pop();
                debugPrint("inside Function");
                Future.microtask(() => context.pushReplacementNamed(
                  Routes.loginScreen,
                ));
                await Provider.of<SignInProvider>(context, listen: false)
                    .clearUserLoginCredentials();
                debugPrint("storage is cleared");
                Future.microtask(() => context.pushReplacementNamed(
                  Routes.loginScreen,
                ));
              }),
        ),
      ),
    );
  }
}
