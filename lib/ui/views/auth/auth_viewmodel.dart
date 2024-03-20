import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/app/models/login_dto.dart';
import 'package:dionniebee/app/models/register_dto.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/services/fluttertoast/fluttertoast_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

enum AuthType { signIn, signUp, passwordResetRequest }

class AuthViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final _navService = locator<RouterService>();

  final toast = locator<FlutterToastService>();

  @override
  void onFutureError(error, Object? key) {
    super.onFutureError(error, key);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dialogService.showDialog(
          title: "Error",
          barrierDismissible: true,
          description: error.toString(),
          dialogPlatform: DialogPlatform.Material);
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
    if (kDebugMode) {
      loginFormModel.updateValue(LoginDto(
        email: 'dionnie_bulingit@yahoo.com',
        password: 'qweqwe123',
      ));
    }
    registerFormModel = RegisterDtoForm(
      RegisterDtoForm.formElements(null),
      null,
    );
  }

  @override
  void dispose() {
    loginFormModel.form.dispose();
    registerFormModel.form.dispose();
    super.dispose();
  }

  Future signInAnonymously() async {
    await runBusyFuture(_authService.signInAnonymously(), throwException: true);
  }

  Future signIn({required email, required password}) async {
    toast.show("Frying potatoes...");
    toast.show("Slicing onions...");
    await runBusyFuture(
      _authService.signInWithEmail(
        email: email,
        password: password,
      ),
    ).then((value) async {
      if (value != null) {
        await _dialogService.showDialog(
            title: "Notice",
            description: value.toString(),
            dialogPlatform: DialogPlatform.Material);
      } else {
        await _navService.replaceWithDashboardView();
      }
    });
  }

  Future signUp({required email, required password}) async {
    await runBusyFuture(
            _authService.signUpWithEmail(email: email, password: password),
            throwException: true)
        .then((value) async {
      if (value != null) {
        await _dialogService.showDialog(
            title: "Notice",
            description: value.toString(),
            dialogPlatform: DialogPlatform.Material);
      } else {
        await _navService.replaceWithDashboardView();
      }
    });
  }
}
