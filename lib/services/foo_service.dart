import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

@Singleton()
class FooService with ListenableServiceMixin {
  final LocalStorageService _localStorage;
  final FirebaseAuthenticationService _authService;
  FooService({
    LocalStorageService? storageService,
    FirebaseAuthenticationService? authService,
  })  : _localStorage = storageService ?? locator<LocalStorageService>(),
        _authService = authService ?? locator<FirebaseAuthenticationService>() {
    listenToReactiveValues([_whoAmI]);
  }

  Future sendHttp(String val) async {
    await _authService.loginAnonymously();
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
