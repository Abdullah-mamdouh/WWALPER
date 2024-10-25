import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wwalper_app/core/helpers/extensions/navigator.dart';
import 'package:wwalper_app/core/routing/routes.dart';
import 'package:wwalper_app/core/theming/styles.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/validator/validators.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/sign-up_cubit/sign_up_cubit.dart';
import '../widgets/arrow_back_widget.dart';
import '../widgets/out_line_button_widget.dart';
import '../widgets/text_hint_widget.dart';
import 'widgets/register_bloc_listener.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                key: context.read<SignupCubit>().formKey,
                child: Column(
                  children: [
                    AppTextFormField(
                      controller: context.read<SignupCubit>().nameController,
                      hintText: AppStrings.userNameKey,
                      validator: fullNameValidator(),
                      keyboardType: TextInputType.name,
                    ),
                    verticalSpace(15),
                    AppTextFormField(
                      controller: context.read<SignupCubit>().emailController,
                      hintText: AppStrings.enterYourEmailKey,
                      keyboardType: TextInputType.emailAddress,
                      validator: emailValidator(),
                    ),
                    verticalSpace(15),
                    AppTextFormField(
                      controller: context.read<SignupCubit>().passwordController,
                      hintText: AppStrings.enterYourPasswordkey,
                      suffixIcon: Icon(
                        Icons.visibility_outlined,
                        color: ColorsManager.grayHintColor,
                      ),
                      validator: passwordValidator(),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    verticalSpace(15),
                    AppTextFormField(
                      controller: context
                          .read<SignupCubit>()
                          .passwordConfirmationController,
                      hintText: AppStrings.confirmPasswordKey,
                      suffixIcon: Icon(
                        Icons.visibility_outlined,
                        color: ColorsManager.grayHintColor,
                      ),
                      validator: confirmPassword(
                        ctrl: context
                            .read<SignupCubit>()
                            .passwordController,
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
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: BouncingButton(
                              width: width(context),
                              icon: SvgPicture.asset(
                                AppAssets.facebook,
                                width: 15.w,
                                height: 26.h,
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
                              style: TextStyles.font16WhiteSemiBold
                                  .copyWith(color: ColorsManager.blackColor),
                              icon: Image.asset(
                                AppAssets.google,
                                width: 30.w,
                                height: 36.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(20),
                    RichText(
                      text: TextSpan(
                        text: AppStrings.dontHaveAnAccount,
                        style: TextStyles.font15BlackSemiBold
                            .copyWith(color: ColorsManager.blackColor),
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
                    RegisterBlocListener(),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
