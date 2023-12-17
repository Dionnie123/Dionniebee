import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/services/foo_service.dart';
import 'package:dionniebee/services/toast_service.dart';
import 'package:dionniebee/services/user_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<RouterService>();
  final _fooService = locator<FooService>();
  final _authService = locator<AuthService>();
  final _userService = locator<UserService>();
  final _toastService = locator<ToastService>();

  whoAmI(String val) {
    _fooService.whoAmI = val;
    notifyListeners();
  }

  Future showToastMessage() async {
    await _toastService.showDialog();
    if (!kIsWeb) FlutterNativeSplash.remove();
  }

  Future<void> runStartUpLogic() async {
    if (_userService.hasLoggedInUser) {
      await _navigationService.replaceWithDashboardView();
    } else {
      await runBusyFuture(_authService.signInAnonymously()).then((_) async {
        await _navigationService.replaceWithDashboardView();
      });
    }
  }
}
