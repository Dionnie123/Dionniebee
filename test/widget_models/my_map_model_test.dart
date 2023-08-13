import 'package:flutter_test/flutter_test.dart';
import 'package:dionniebee/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('MyMapModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
