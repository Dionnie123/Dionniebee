import 'package:dionniebee/global/colors.dart';
import 'package:dionniebee/global/ui_helpers.dart';
import 'package:dionniebee/ui/special/ez_button.dart';
import 'package:dionniebee/global/typography.dart';
import 'package:dionniebee/ui/views/auth/auth_viewmodel.dart';
import 'package:dionniebee/ui/views/auth/busykeys.dart';
import 'package:flutter/foundation.dart';

import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<AuthViewModel>(context);
    if (kDebugMode) {
      viewModel.loginForm.patchValue({
        LoginKeys.email.name: 'dionnie_bulingit@yahoo.com',
        LoginKeys.password.name: 'qweqwe123'
      });
    }
    return ReactiveFormConsumer(builder: (context, formModel, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/logo-red.png",
                  width: 70,
                ),
                vSpaceSmall,
                const EzText.headingThree("SIGN-IN"),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          ReactiveTextField<String>(
            formControlName: LoginKeys.email.name,
            textInputAction: TextInputAction.next,
            validationMessages: {
              ValidationMessage.required: (_) => 'Required',
              ValidationMessage.email: (_) => 'Invalid email'
            },
            decoration: const InputDecoration(
              labelText: 'Email',
              helperText: '',
              helperStyle: TextStyle(height: 0.8),
              errorStyle: TextStyle(height: 0.8),
            ),
          ),
          const SizedBox(height: 8.0),
          ReactiveTextField<String>(
            formControlName: LoginKeys.password.name,
            obscureText: true,
            validationMessages: {
              ValidationMessage.required: (_) => 'Required',
            },
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              labelText: "Password",
              helperText: '',
              helperStyle: TextStyle(height: 0.8),
              errorStyle: TextStyle(height: 0.8),
            ),
          ),
          const SizedBox(height: 8.0),
          EzButton(
            backgroundColor: kcPrimary,
            busy: viewModel.busy(signInKey),
            title: 'SIGN IN',
            disabled: formModel.invalid ? true : false,
            onPressed: () async {
              await viewModel.signIn(
                email: formModel.controls[LoginKeys.email.name]?.value,
                password: formModel.controls[LoginKeys.password.name]?.value,
              );
            },
          ),
          vSpaceSmall,
          EzButton(
            backgroundColor: kcDark,
            title: 'ORDER AS GUEST',
            onPressed: () async {
              await viewModel.goToDashboard();
            },
          ),
          vSpaceSmall,
          EzButton(
            busy: viewModel.busy(loginWithGoogleKey),
            backgroundColor: Colors.blue,
            title: 'SIGN IN WITH GOOGLE',
            onPressed: () async {
              await viewModel.signInWithGoogle();
            },
          ),
          const SizedBox(height: 18.0),
          TextButton(
              onPressed: () {
                formModel.reset();

                viewModel.authType = AuthType.signUp;
              },
              child: const Text(
                "Still not a member? Sign up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )),
        ],
      );
    });
  }
}
