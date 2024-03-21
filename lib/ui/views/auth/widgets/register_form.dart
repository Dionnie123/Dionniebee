import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/app/models/register_dto.dart';
import 'package:dionniebee/ui/common/colors.dart';
import 'package:dionniebee/ui/common/my_texts.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:dionniebee/ui/special/ez_button.dart';
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

    return ReactiveRegisterDtoFormConsumer(builder: (context, formModel, _) {
      /*    formModel.form.updateValue({
        'name': 'Mark Dionnie Bulingit',
        'email': 'bulingitmarkdionnie@gmail.com',
        'password': 'qweqwe123',
        'passwordConfirmation': 'qweqwe123',
        'acceptLicense': true
      }); */
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
                const MyText.headingThree("SIGN-UP"),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          ReactiveTextField<String>(
            formControl: formModel.nameControl,
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
            formControl: formModel.emailControl,
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
            formControl: formModel.passwordControl,
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
            formControl: formModel.passwordConfirmationControl,
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
                  formControl: formModel.acceptLicenseControl,
                  activeColor: kcPrimaryColor,
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
          ReactiveRegisterDtoFormConsumer(
            builder: (context, formModel, child) {
              return EzButton(
                backgroundColor: kcPrimaryColor,
                busy: viewModel.busy(signUpKey),
                title: 'SIGN UP',
                disabled: formModel.form.hasErrors ? true : false,
                onPressed: () async {
                  removeFocus();
                  await viewModel.signUp(
                      email: formModel.emailControl?.value,
                      password: formModel.passwordControl?.value);
                },
              );
            },
          ),
          vSpaceSmall,
          EzButton(
            backgroundColor: kcDark,
            title: 'ORDER AS GUEST',
            onPressed: () async {
              await viewModel.navService.replaceWithDashboardView();
            },
          ),
          const SizedBox(height: 18.0),
          TextButton(
              onPressed: () {
                formModel.form.reset();

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
