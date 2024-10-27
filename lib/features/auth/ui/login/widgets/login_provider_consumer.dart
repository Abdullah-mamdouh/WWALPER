import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/core/helpers/extensions/navigator.dart';
import 'package:wwalper_app/core/widgets/custom_show_toast.dart';
import 'package:wwalper_app/features/auth/logic/sign_in_provider/sign_in_state.dart';

import '../../../../../core/routing/routes.dart';
import '../../../logic/sign_in_provider/sign_in_provider.dart';

class LoginProviderListener extends StatelessWidget {
  const LoginProviderListener({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInProvider>(
      builder: (context, provider, child) {
        final state = provider.state;
        if (state is Loading) {
          // show loading dialog or widget
        } else if (state is Success) {
          showToast(text: 'Successfull', state: ToastStates.success);
          Future.microtask(() => context.pushReplacementNamed(Routes.managerScreen));
        } else if (state is Error) {
          showToast(text: state.error, state: ToastStates.error);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

/*
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
*/