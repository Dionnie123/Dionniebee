import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final authService = locator<AuthService>();
  final navService = locator<RouterService>();

  redirect() {
    if (authService.user != null) {
      // navService.router.pendingRoutesHandler.hasPendingRoutes;
      navService.replaceWithHomeView();
    } else {
      navService.replaceWithAuthView();
    }
  }
}
