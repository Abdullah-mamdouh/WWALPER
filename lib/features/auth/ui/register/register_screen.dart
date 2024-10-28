import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/core/helpers/extensions/navigator.dart';
import 'package:wwalper_app/core/routing/routes.dart';
import 'package:wwalper_app/core/theming/styles.dart';
import 'package:wwalper_app/core/theming/theme_provider.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/validator/validators.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/custom_show_toast.dart';
import '../../logic/sign-up_provider/sign_up_provider.dart';
import '../widgets/arrow_back_widget.dart';
import '../widgets/out_line_button_widget.dart';
import '../widgets/text_hint_widget.dart';
import 'widgets/register_provider_consumer.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool password = false, confirm = false;

  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context);

    return Scaffold(
      body: Consumer<SignupProvider>(builder: (context, signupProvider, child) {
        //final state = signupProvider.state;
        final signupProvider = Provider.of<SignupProvider>(context);
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(40),
                ArrowBackWidget(),
                verticalSpace(20),
                Text(
                  AppStrings.gettingStartedkey,
                  style: TextStyles.font20BlackBold,
                ),
                verticalSpace(10),
                TextHintWidget(text: AppStrings.createAccountKey),
                verticalSpace(20),
                Form(
                  key: signupProvider.formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        controller: signupProvider.nameController,
                        hintText: AppStrings.userNameKey,
                        validator: fullNameValidator(),
                        keyboardType: TextInputType.name,
                      ),
                      verticalSpace(15),
                      AppTextFormField(
                        controller: signupProvider.emailController,
                        hintText: AppStrings.enterYourEmailKey,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator(),
                      ),
                      verticalSpace(15),
                      AppTextFormField(
                        controller: signupProvider.passwordController,
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
                        isObscureText: !password,
                        validator: passwordValidator(),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      verticalSpace(15),
                      AppTextFormField(
                        controller:
                            signupProvider.passwordConfirmationController,
                        hintText: AppStrings.confirmPasswordKey,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              confirm = !confirm;
                            });
                          },
                          icon: !confirm
                              ? Icon(Icons.visibility_outlined)
                              : Icon(Icons.visibility_off_outlined),
                          color: ColorsManager.grayHintColor,
                        ),
                        isObscureText: !confirm,
                        validator: confirmPassword(
                          ctrl: signupProvider.passwordController,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      verticalSpace(30),
                      BouncingButton(
                        child: Text(
                          AppStrings.registerKey,
                          style: TextStyles.font16WhiteSemiBold,
                        ),
                        onPress: () {
                          validateThenDoSignup(context);
                        },
                      ),
                      verticalSpace(40),
                      TextHintWidget(text: AppStrings.socialAccountKey),
                      verticalSpace(30),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: BouncingButton(
                                color: ColorsManager.blueColor,
                                width: width(context),
                                icon: Image.asset(
                                  AppAssets.facebook,
                                  //width: 15.w,
                                  height: 30.h,
                                ),
                                child: Text(
                                  AppStrings.facebookKey,
                                  style: TextStyles.font16WhiteSemiBold,
                                ),
                                onPress: () {},
                              ),
                            ),
                            horizontalSpace(20),
                            Expanded(
                              child: AppOutLineButton(
                                text: AppStrings.googleKey,
                                style: TextStyles.font16WhiteSemiBold.copyWith(
                                  color: Provider.of<ThemeProvider>(context).isDark ? Colors.white : Colors.black
                                ),
                                icon: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage( AppAssets.google,),radius: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(30),
                      RichText(
                        text: TextSpan(
                          text: AppStrings.dontHaveAnAccount,
                          style: TextStyles.font15BlackSemiBold.copyWith(
                            color: Provider.of<ThemeProvider>(context).isDark ? Colors.white: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => context.pushNamed(Routes.loginScreen),
                              text: AppStrings.signinKey,
                              style: TextStyles.font15BlackSemiBold.copyWith(
                                color: ColorsManager.purpleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RegisterProviderListener(), // Implement listener if needed
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context, listen: false);
    if (signupProvider.formKey.currentState!.validate()) {
      signupProvider.emitSignupStates(context);
    }
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showToast(text: error, state: ToastStates.error);
  }
}
