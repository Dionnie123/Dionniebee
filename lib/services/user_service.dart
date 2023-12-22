import 'package:dionniebee/app/models/user_dto.dart';
import 'package:stacked/stacked.dart';

class UserService with ListenableServiceMixin {
  UserService() {
    listenToReactiveValues([_currentUser]);
  }
  final ReactiveValue<UserDto?> _currentUser = ReactiveValue<UserDto?>(null);
  UserDto? get currentUser => _currentUser.value;
  set currentUser(UserDto? value) {
    _currentUser.value = value;
    notifyListeners();
  }

  bool get hasLoggedInUser => _currentUser.value?.id != null;
}
