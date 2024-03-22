import 'package:dionniebee/app/models/login_dto.dart';
import 'package:dionniebee/app/models/register_dto.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
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
