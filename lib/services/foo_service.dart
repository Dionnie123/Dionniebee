import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@Singleton()
class FooService with ListenableServiceMixin {
  final LocalStorageService _localStorage;
  final AuthService _authService;
  FooService({
    LocalStorageService? storageService,
    AuthService? authService,
  })  : _localStorage = storageService ?? locator<LocalStorageService>(),
        _authService = authService ?? locator<AuthService>() {
    listenToReactiveValues([_whoAmI]);
  }

  Future sendHttp(String val) async {
    await _authService.signInAnonymously();
    _whoAmI = val;
    _localStorage.saveToDisk('whoAmI', val);
  }

  String? _whoAmI;
  String? get whoAmI => _whoAmI;
  set whoAmI(String? val) {
    _whoAmI = val;
    notifyListeners();
  }
}
