import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/core/helpers/extensions/navigator.dart';
import 'package:wwalper_app/core/helpers/spacing.dart';
import 'package:wwalper_app/core/helpers/validator/validators.dart';
import 'package:wwalper_app/core/theming/colors.dart';
import 'package:wwalper_app/core/theming/styles.dart';
import 'package:wwalper_app/core/utils/app_strings.dart';
import 'package:wwalper_app/core/widgets/app_text_button.dart';
import 'package:wwalper_app/core/widgets/app_text_form_field.dart';
import 'package:wwalper_app/features/auth/ui/login/widgets/login_provider_consumer.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../logic/sign_in_provider/sign_in_provider.dart';
import '../widgets/out_line_button_widget.dart';
import '../widgets/text_hint_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool password = false;
  @override
  // void initState() {
  //   super.initState();
  //   Provider.of<SignInProvider>(context, listen: false)
  //       .fetchUserLoginCredentials();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(40),
              //ArrowBackWidget(),
              verticalSpace(20),
              Text(
                AppStrings.letsSignkey,
                style: TextStyles.font20BlackBold,
              ),
              verticalSpace(10),
              TextHintWidget(text: AppStrings.welcomekey),
              verticalSpace(30),
              Form(
                key: context.read<SignInProvider>().formKey,
                child: Column(
                  children: [
                    AppTextFormField(
                        controller:
                            context.read<SignInProvider>().emailController,
                        hintText: AppStrings.enterYourEmailKey,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator()),
                    verticalSpace(15),
                    AppTextFormField(
                      controller:
                          context.read<SignInProvider>().passwordController,
                      hintText: AppStrings.enterYourPasswordkey,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            password = !password;
                          });
                        },

                        icon: !password
                            ? Icon(Icons.visibility_outlined)
                            : Icon(Icons.visibility_off_outlined),
                        color: ColorsManager.grayHintColor,
                      ),
                      validator: passwordValidator(),
                      keyboardType: TextInputType.visiblePassword,
                      isObscureText: !password,
                    ),
                    verticalSpace(20),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        AppStrings.forgetPasswordkey,
                        style: TextStyles.font12WhiteBold.copyWith(
                          color: ColorsManager.purpleColor,
                        ),
                      ),
                    ),
                    verticalSpace(30),
                    BouncingButton(
                      child: Text(
                        AppStrings.loginKey,
                        style: TextStyles.font16WhiteSemiBold,
                      ),
                      onPress: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(40),
                    TextHintWidget(text: AppStrings.socialAccountKey),
                    verticalSpace(10),
                    BouncingButton(
                      color: ColorsManager.blueColor,
                      icon: Image.asset(
                        AppAssets.facebook,
                        height: 30.h,
                      ),
                      child: Text(
                        AppStrings.signInFacebookKey,
                        style: TextStyles.font16WhiteSemiBold,
                      ),
                      onPress: () {},
                    ),
                    verticalSpace(15),
                    AppOutLineButton(
                        text: AppStrings.signInGoogleKey,
                        style: TextStyles.font16WhiteSemiBold
                            .copyWith(color: ColorsManager.blackColor),
                        icon: Image.asset(
                          AppAssets.google,
                          width: 25.w,
                          height: 36.h,
                        )),
                    verticalSpace(20),
                    RichText(
                      text: TextSpan(
                        text: AppStrings.dontHaveAnAccount,
                        style: TextStyles.font15BlackSemiBold
                            .copyWith(color: ColorsManager.blackColor),
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  context.pushNamed(Routes.registerScreen),
                            text: AppStrings.signupKey,
                            style: TextStyles.font15BlackSemiBold.copyWith(
                              color: ColorsManager.purpleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const LoginProviderListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<SignInProvider>().formKey.currentState!.validate()) {
      context.read<SignInProvider>().emitSignInStates();
    }
  }
}
