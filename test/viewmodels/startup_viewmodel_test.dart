import 'package:flutter_test/flutter_test.dart';
import 'package:dionniebee/app/app.locator.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('StartupViewModel Tests -', () {
    setUp(() {
      registerServices();
      locator.allowReassignment = true;
    });

    tearDown(() => locator.reset());
    group('initialise -', () {
      test('testing', () async {
        var mockStorageService = MockLocalStorageService();
        mockStorageService.saveToDisk('code', 'abc123');
        verify(mockStorageService.saveToDisk('code', 'abc123'));
        //expect(mockStorageService.getFromDisk('code') != null, true);
      });
    });
  });
}
