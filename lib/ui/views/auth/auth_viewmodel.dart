import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/app/models/user_dto.dart';
import 'package:dionniebee/services/user_service.dart';
import 'package:dionniebee/ui/views/auth/busykeys.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

enum AuthType { signIn, signUp, passwordResetRequest }

enum LoginKeys { email, name, password, passwordConfirmation }

enum RegisterKeys { email, name, password, passwordConfirmation, acceptLicense }

enum Address { city, state }

class AuthViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navService = locator<RouterService>();
  final _authService = locator<FirebaseAuthenticationService>();
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

  AuthType _authType = AuthType.signIn;
  AuthType get authType => _authType;
  set authType(AuthType val) {
    _authType = val;
    notifyListeners();
  }

  final loginForm = FormGroup({
    LoginKeys.email.name: FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
    LoginKeys.password.name: FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(6),
    ]),
  });

  final registerForm = FormGroup({
    RegisterKeys.name.name: FormControl<String>(
      validators: [Validators.required],
    ),
    RegisterKeys.email.name: FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
    RegisterKeys.password.name: FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
    ]),
    RegisterKeys.passwordConfirmation.name: FormControl<String>(),
    RegisterKeys.acceptLicense.name: FormControl<bool>(
      validators: [Validators.required],
    ),
  }, validators: [
    //Validators.mustMatch(RegisterKeys.email.name, 'emailConfirmation'),
    Validators.mustMatch(
        RegisterKeys.password.name, RegisterKeys.passwordConfirmation.name),
  ]);

  init() {}

  @override
  void dispose() {
    loginForm.dispose();
    registerForm.dispose();
    super.dispose();
  }

  Future goToDashboard() async {
    await _navService.replaceWithDashboardView();
  }

  Future signInWithGoogle() async {
    setBusyForObject(loginWithGoogleKey, true);

    final result = await _authService.signInWithGoogle();
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
      await goToDashboard();
    }
    setBusyForObject(loginWithGoogleKey, false);
  }

  Future signIn({required email, required password}) async {
    setBusyForObject(signInKey, true);

    final result = await _authService.loginWithEmail(
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
      await goToDashboard();
    }
    setBusyForObject(signInKey, false);
  }

  Future signUp({required email, required password}) async {
    setBusyForObject(signUpKey, true);

    final result = await _authService.createAccountWithEmail(
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
      await goToDashboard();
    }
    setBusyForObject(signUpKey, false);
  }
}
