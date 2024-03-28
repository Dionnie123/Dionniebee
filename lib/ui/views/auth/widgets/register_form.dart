import 'package:dionniebee/global/colors.dart';
import 'package:dionniebee/global/ui_helpers.dart';
import 'package:dionniebee/ui/special/ez_button.dart';
import 'package:dionniebee/global/typography.dart';
import 'package:dionniebee/ui/views/auth/auth_viewmodel.dart';
import 'package:dionniebee/ui/views/auth/busykeys.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<AuthViewModel>(context);

    removeFocus() {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.focusedChild?.unfocus();
      }
    }

    return ReactiveFormConsumer(builder: (context, formModel, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/logo-red.png",
                  width: 70,
                ),
                vSpaceSmall,
                const EzText.headingThree("SIGN-UP"),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          ReactiveTextField<String>(
            formControlName: RegisterKeys.name.name,
            validationMessages: {
              ValidationMessage.required: (_) => 'Required',
            },
            textInputAction: TextInputAction.next,
            style: const TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              labelText: "Name",
              helperText: '',
              helperStyle: TextStyle(height: 0.8),
              errorStyle: TextStyle(height: 0.8),
            ),
          ),
          const SizedBox(height: 8.0),
          ReactiveTextField<String>(
            formControlName: RegisterKeys.email.name,
            validationMessages: {
              ValidationMessage.required: (_) => 'Required',
              ValidationMessage.email: (_) => 'Invalid email'
            },
            textInputAction: TextInputAction.next,
            style: const TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              labelText: 'Email',
              helperText: '',
              helperStyle: TextStyle(height: 0.8),
              errorStyle: TextStyle(height: 0.8),
            ),
          ),
          const SizedBox(height: 8.0),
          ReactiveTextField<String>(
            formControlName: RegisterKeys.password.name,
            obscureText: true,
            validationMessages: {ValidationMessage.required: (_) => 'Required'},
            textInputAction: TextInputAction.next,
            style: const TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              labelText: "Password",
              helperText: '',
              helperStyle: TextStyle(height: 0.8),
              errorStyle: TextStyle(height: 0.8),
            ),
          ),
          const SizedBox(height: 8.0),
          ReactiveTextField<String>(
            formControlName: RegisterKeys.passwordConfirmation.name,
            obscureText: true,
            validationMessages: {
              ValidationMessage.required: (_) => 'Required',
              ValidationMessage.mustMatch: (_) => "Password do not match",
            },
            textInputAction: TextInputAction.next,
            style: const TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              labelText: "Confirm Password",
              helperText: '',
              helperStyle: TextStyle(height: 0.8),
              errorStyle: TextStyle(height: 0.8),
            ),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1,
                child: ReactiveCheckbox(
                  onChanged: (control) {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  formControlName: RegisterKeys.acceptLicense.name,
                  activeColor: kcPrimary,
                ),
              ),
              const SizedBox(width: 8),
              const Expanded(
                  child: Text(
                "I accept terms and conditions & privacy policy",
                style: TextStyle(fontSize: 14),
              ))
            ],
          ),
          const SizedBox(height: 24.0),
          EzButton(
            backgroundColor: kcPrimary,
            busy: viewModel.busy(signUpKey),
            title: 'SIGN UP',
            disabled: formModel.invalid ? true : false,
            onPressed: () async {
              removeFocus();
              await viewModel.signUp(
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
          const SizedBox(height: 18.0),
          TextButton(
              onPressed: () {
                formModel.reset();

                viewModel.authType = AuthType.signIn;
              },
              child: const Text(
                "Already a member? Sign in",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )),
        ],
      );
    });
  }
}
