import 'package:dionniebee/ui/views/auth/auth_viewmodel.dart';
import 'package:dionniebee/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dionniebee/app/app.locator.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  group('StartupViewModel Tests -', () {
    setUp(() => registerServices());

    test('When called should check hasUser on authService', () {
      var auth = getAndRegisterAuthService();
      var model = StartupViewModel();
      bool t = model.isUserPresent();
      expect(t, false);
    });

    tearDown(() => locator.reset());
  });
}
