import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/app/models/login_dto.dart';
import 'package:dionniebee/app/models/register_dto.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

enum AuthType { signIn, signUp, passwordResetRequest }

class AuthViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final _navService = locator<RouterService>();

  @override
  void onFutureError(error, Object? key) {
    super.onFutureError(error, key);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dialogService.showDialog(
          title: "Error",
          barrierDismissible: true,
          description: error.toString(),
          dialogPlatform: DialogPlatform.Custom);
    });
  }

  late LoginDtoForm loginFormModel;
  late RegisterDtoForm registerFormModel;

  AuthType _authType = AuthType.signIn;
  AuthType get authType => _authType;
  set authType(AuthType val) {
    _authType = val;
    notifyListeners();
  }

  initialiseForms() {
    loginFormModel = LoginDtoForm(LoginDtoForm.formElements(LoginDto()), null);
    if (loginFormModel.form.disabled) {
      loginFormModel.form.markAsDisabled();
    }
    registerFormModel =
        RegisterDtoForm(RegisterDtoForm.formElements(RegisterDto()), null);
    if (registerFormModel.form.disabled) {
      registerFormModel.form.markAsDisabled();
    }
    if (!kIsWeb) FlutterNativeSplash.remove();
  }

  Future signIn({required email, required password}) async {
    await runBusyFuture(
            _authService.signInWithEmail(email: email, password: password),
            throwException: true)
        .then((value) {
      _navService.replaceWithHomeView();
    });
  }

  Future signUp({required email, required password}) async {
    await runBusyFuture(
            _authService.signUpWithEmail(email: email, password: password),
            throwException: true)
        .then((value) {
      if (value != null) {
        _dialogService.showDialog(
            title: "Notice",
            description: value.toString(),
            dialogPlatform: DialogPlatform.Custom);
      }
    });
  }
}
