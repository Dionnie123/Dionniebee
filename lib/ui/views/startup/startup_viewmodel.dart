import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';

import 'package:dionniebee/services/foo_service.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<RouterService>();
  final _fooService = locator<FooService>();

  whoAmI(String val) {
    _fooService.whoAmI = val;
    notifyListeners();
  }

  Future<void> runStartUpLogic() async {
    await Future.delayed(const Duration(seconds: 1));
    await _navigationService.replaceWithDashboardView();
  }
}
