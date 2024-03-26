import 'package:dionniebee/app/models/login_dto.dart';
import 'package:dionniebee/app/models/register_dto.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'auth_viewmodel.dart';
import 'widgets/login_form.dart';
import 'widgets/register_form.dart';

class _LoginFormKeys {
  String email = 'email';
  String name = 'name';
  String password = 'password';
  String passwordConfirmation = 'passwordConfirmation';
}

enum LoginKeys { email, name, password, passwordConfirmation }

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fk = _LoginFormKeys();

    final form = FormGroup({
      LoginKeys.name.name:
          FormControl<String>(validators: [Validators.required]),
      fk.email: FormControl<String>(validators: [
        Validators.required,
        Validators.email,
      ]),
      fk.password: FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(8),
      ]),
      fk.passwordConfirmation: FormControl<String>(),
    }, validators: [
      MustMatchValidator(fk.password, fk.passwordConfirmation, true)
    ]);

    return ReactiveForm(
      formGroup: form,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          ReactiveTextField(
            formControlName: fk.name,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          vSpaceRegular,
          ReactiveTextField(
            formControlName: fk.email,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          vSpaceRegular,
          ReactiveTextField(
            formControlName: fk.password,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          vSpaceRegular,
          ReactiveTextField(
            formControlName: fk.passwordConfirmation,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Confirm Password'),
          ),
        ],
      ),
    );
  }
}

class AuthView extends StackedView<AuthViewModel> {
  const AuthView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AuthViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(body: Center(
        child: LayoutBuilder(builder: (context, size) {
          return SingleChildScrollView(
            padding: scaffoldBodyPadding(
                size: size, targetWidth: 500, hPadding: 15, vPadding: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                vSpaceRegular,
                const MyWidget(),
                (viewModel.authType == AuthType.signIn)
                    ? ReactiveLoginDtoForm(
                        key: ObjectKey(viewModel.loginFormModel),
                        form: viewModel.loginFormModel,
                        child: const LoginForm(),
                      )
                    : ReactiveRegisterDtoForm(
                        key: ObjectKey(viewModel.registerFormModel),
                        form: viewModel.registerFormModel,
                        child: const RegisterForm(),
                      ),
                vSpaceRegular,
              ],
            ),
          );
        }),
      )),
    );
  }

  @override
  bool get disposeViewModel => true;

  @override
  AuthViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AuthViewModel();

  @override
  Future<void> onViewModelReady(AuthViewModel viewModel) async {
    viewModel.init();

    super.onViewModelReady(viewModel);
  }
}
