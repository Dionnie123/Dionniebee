import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/app/models/login_dto.dart';
import 'package:dionniebee/app/models/register_dto.dart';
import 'package:dionniebee/app/models/user_dto.dart';
import 'package:dionniebee/services/fluttertoast/fluttertoast_service.dart';
import 'package:dionniebee/services/user_service.dart';
import 'package:dionniebee/ui/views/auth/busykeys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

enum AuthType { signIn, signUp, passwordResetRequest }

enum LoginKeys { email, name, password, passwordConfirmation }

class AuthViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final navService = locator<RouterService>();
  final firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  final toast = locator<FlutterToastService>();
  final _userService = locator<UserService>();

  @override
  void onFutureError(error, Object? key) {
    super.onFutureError(error, key);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _dialogService.showDialog(
          title: "Error",
          barrierDismissible: true,
          description: error.toString(),
          dialogPlatform: DialogPlatform.Custom,
          buttonTitle: "OK");
    });
  }

  late LoginDtoForm loginFormModel;
  late RegisterDtoForm registerFormModel;

  AuthType _authType = AuthType.signIn;
  AuthType get authType => _authType;
  set authType(AuthType val) {
    _authType = val;
    init();
    notifyListeners();
  }

  init() {
    loginFormModel = LoginDtoForm(
      LoginDtoForm.formElements(null),
      null,
    );
    registerFormModel = RegisterDtoForm(
      RegisterDtoForm.formElements(null),
      null,
    );
    if (kDebugMode || true) {
      loginFormModel.updateValue(LoginDto(
        email: 'admin@example.com',
        password: 'admin123',
      ));
      registerFormModel.updateValue(RegisterDto(
          name: 'admin',
          email: 'admin@example.com',
          password: 'admin',
          passwordConfirmation: 'admin',
          acceptLicense: true));
    }
  }

  @override
  void dispose() {
    loginFormModel.form.dispose();
    registerFormModel.form.dispose();
    super.dispose();
  }

  Future signInWithGoogle() async {
    setBusyForObject(loginWithGoogleKey, true);

    final result = await firebaseAuthenticationService.signInWithGoogle();
    if (result.hasError) {
      onFutureError(result.errorMessage, null);
      setBusyForObject(loginWithGoogleKey, false);
      return;
    }
    if (result.user != null) {
      _userService.currentUser = UserDto(
        id: result.user!.uid,
        email: result.user!.email,
      );
      await navService.replaceWithDashboardView();
    }
    setBusyForObject(loginWithGoogleKey, false);
  }

  Future signIn({required email, required password}) async {
    setBusyForObject(signInKey, true);
    toast.show("Frying potatoes...");
    toast.show("Slicing onions...");

    final result = await firebaseAuthenticationService.loginWithEmail(
      email: email,
      password: password,
    );
    if (result.hasError) {
      onFutureError(result.errorMessage, null);
      setBusyForObject(signInKey, false);
      return;
    }
    if (result.user != null) {
      _userService.currentUser = UserDto(
        id: result.user!.uid,
        email: result.user!.email,
      );
      await navService.replaceWithDashboardView();
    }
    setBusyForObject(signInKey, false);
  }

  Future signUp({required email, required password}) async {
    setBusyForObject(signUpKey, true);

    final result = await firebaseAuthenticationService.createAccountWithEmail(
      email: email,
      password: password,
    );
    if (result.hasError) {
      onFutureError(result.errorMessage, null);
      setBusyForObject(signUpKey, false);
      return;
    }
    if (result.user != null) {
      _userService.currentUser = UserDto(
        id: result.user!.uid,
        email: result.user!.email,
      );
      await navService.replaceWithDashboardView();
    }
    setBusyForObject(signUpKey, false);
  }
}
