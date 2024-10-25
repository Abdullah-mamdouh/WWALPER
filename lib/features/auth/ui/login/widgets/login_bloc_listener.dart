import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wwalper_app/core/helpers/extensions/navigator.dart';
import 'package:wwalper_app/core/widgets/custom_show_toast.dart';
import 'package:wwalper_app/features/auth/logic/sign_in_cubit/sign_in_state.dart';

import '../../../../../core/routing/routes.dart';
import '../../../logic/sign_in_cubit/sign_in_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            // showDialog(
            //   context: context,
            //   builder: (context) => const CircularProgressIndicator(),
            // );
          },
          success: (loginResponse) {

            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            showToast(text: error, state: ToastStates.error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

}
