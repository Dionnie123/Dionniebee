import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/services/firebase_auth_service.dart';
import 'package:dionniebee/services/user_service.dart';
import 'package:dionniebee/ui/views/startup/startup_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dionniebee/app/app.locator.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import '../helpers/test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('StartupViewModel Tests -', () {
    setUp(() {
      registerServices();
      locator.allowReassignment = true;
    });
    tearDown(() => locator.reset());
    test('On Startup user is not logged in has to be signed-in anonymously',
        () async {
      var authService = getAndRegisterAuthService();
      var userService = getAndRegisterUserService(hasLoggedInUser: false);
      var toastService = getAndRegisterToastService();
      var navigationService = getAndRegisterRouterService();
      var viewModel = StartupViewModel();
      await viewModel.runStartUpLogic();
      expect(userService.hasLoggedInUser, false);
      verify(userService.hasLoggedInUser);
      verify(authService.signInAnonymously()).called(1);
      verify(toastService.show('Welcome [User]')).called(1);
      verify(navigationService.replaceWithDashboardView()).called(1);
    });

    test(
        'On Startup user is already logged in and needs to be redirected to dashboard',
        () async {
      var userService = getAndRegisterUserService(hasLoggedInUser: true);
      var authService = getAndRegisterAuthService();
      var navigationService = locator<RouterService>();
      var viewModel = StartupViewModel();
      await viewModel.runStartUpLogic();
      expect(userService.hasLoggedInUser, true);
      verifyNever(authService.signInAnonymously());
      verify(navigationService.replaceWithDashboardView()).called(1);
    });
  });
}
