import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final navService = locator<RouterService>();

  Future signInAnonymously() async {
    try {
      if (_authService.user == null) {
        await runBusyFuture(_authService.signInAnonymously(),
                throwException: true)
            .then((value) async {
          if (value == null) {
            await navService.replaceWithDashboardView();
            await Fluttertoast.showToast(
                msg: "Signed-in anonymously...",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        });
      } else {
        await navService.replaceWithDashboardView();
      }
    } catch (e) {
      await navService.replaceWithAuthView();
    }

    if (!kIsWeb) FlutterNativeSplash.remove();
  }
}
