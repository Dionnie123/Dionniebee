import 'package:dionniebee/app/models/login_dto.dart';
import 'package:dionniebee/app/models/register_dto.dart';
import 'package:dionniebee/ui/special/onboard/onboarding.dart';
import 'package:dionniebee/ui/special/scaffold_body_wrapper.dart';
import 'package:dionniebee/ui/views/auth/widgets/login_form.dart';
import 'package:dionniebee/ui/views/auth/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'auth_viewmodel.dart';

class AuthViewDesktop extends ViewModelWidget<AuthViewModel> {
  const AuthViewDesktop({super.key});

  @override
  Widget build(BuildContext context, AuthViewModel viewModel) {
    return Scaffold(body: LayoutBuilder(builder: (context, size) {
      return ScaffoldBodyWrapper(
          isFullWidth: true,
          padding: EdgeInsets.zero,
          builder: (context, size) {
            return SizedBox(
              height: size.maxHeight,
              width: size.maxWidth,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                        width: size.maxWidth,
                        height: size.maxHeight,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: const Onboarding()),
                        )),
                  ),
                  Expanded(
                      flex: 2,
                      child: Center(
                        child: SizedBox(
                          width: 600,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                (viewModel.authType == AuthType.signIn)
                                    ? ReactiveLoginDtoForm(
                                        key:
                                            ObjectKey(viewModel.loginFormModel),
                                        form: viewModel.loginFormModel,
                                        child: const LoginForm(),
                                      )
                                    : ReactiveRegisterDtoForm(
                                        key: ObjectKey(
                                            viewModel.registerFormModel),
                                        form: viewModel.registerFormModel,
                                        child: const RegisterForm(),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            );
          });
    }));
  }
}
