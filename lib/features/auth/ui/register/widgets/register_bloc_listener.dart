import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wwalper_app/core/helpers/extensions/navigator.dart';
import 'package:wwalper_app/core/utils/app_strings.dart';
import 'package:wwalper_app/features/auth/logic/sign-up_cubit/sign_up_cubit.dart';
import 'package:wwalper_app/features/auth/logic/sign-up_cubit/sign_up_state.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_show_toast.dart';
class RegisterBlocListener extends StatelessWidget {
  RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
      current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          success: (respons) async {
            showToast(text: AppStrings.registerKey, state: ToastStates.success);
            context.pushReplacementNamed(Routes.loginScreen);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showToast(text: error, state:ToastStates.error );
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //      elevation: 0,
    //   insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
    //   contentPadding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(30.r),
    //   ),
    //     icon: const Icon(
    //       Icons.error,
    //       color: Colors.red,
    //       size: 32,
    //     ),
    //     content: Text(
    //       error,
    //       style: TextStyles.font15DarkBlueMedium,
    //     ),
    //     actions: [
    //       TextButton(
    //         onPressed: () {
    //         context.pop();
    //         },
    //         child: Text(
    //           'Got it',
    //           style: TextStyles.font12BlackBold,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}