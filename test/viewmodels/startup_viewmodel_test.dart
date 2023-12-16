import 'package:dionniebee/services/user_service.dart';
import 'package:dionniebee/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dionniebee/app/app.locator.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('StartupViewModel Tests -', () {
    setUp(() {
      registerServices();
      locator.allowReassignment = true;
    });
    tearDown(() => locator.reset());

    test('When called should check if we have a logged in user on UserService',
        () async {
      var userService = locator<UserService>();
      var viewModel = StartupViewModel();
      await viewModel.runStartUpLogic();

      verify(userService.hasLoggedInUser);
    });
  });
}
