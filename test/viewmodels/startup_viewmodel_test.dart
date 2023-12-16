import 'package:dionniebee/services/foo_service.dart';
import 'package:dionniebee/services/local_storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dionniebee/app/app.locator.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

class Fuck extends Mock implements LocalStorageService {}

void main() {
  group('StartupViewModel Tests -', () {
    setUp(() {
      registerServices();
      locator.allowReassignment = true;
    });

    tearDown(() => locator.reset());
    group('initialise -', () {
      test('testing', () async {
        var storageService = Fuck();

        var authService = MockAuthService();
        var mockFooService = FooService(
          authService: authService,
          storageService: storageService,
        );
        await mockFooService.sendHttp("Jesus");
        verify(await authService.signInAnonymously());
        verify(storageService.saveToDisk('whoAmI', "Jesus")).called(1);
      });
    });
  });
}
