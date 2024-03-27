import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'auth_viewmodel.dart';
import 'widgets/login_form.dart';
import 'widgets/register_form.dart';

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
                (viewModel.authType == AuthType.signIn)
                    ? ReactiveForm(
                        key: const ObjectKey('login'),
                        formGroup: viewModel.loginForm,
                        child: const LoginForm(),
                      )
                    : ReactiveForm(
                        key: const ObjectKey('register'),
                        formGroup: viewModel.registerForm,
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
