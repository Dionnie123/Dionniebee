import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@Singleton()
class FooService with ListenableServiceMixin {
  FooService() {
    listenToReactiveValues([_whoAmI]);
  }
  String? _whoAmI;
  String? get whoAmI => _whoAmI;
  set whoAmI(String? val) {
    _whoAmI = val;
    notifyListeners();
  }
}
