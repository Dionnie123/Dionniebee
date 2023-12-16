import 'package:dionniebee/app/app.logger.dart';
import 'package:dionniebee/app/models/user_dto.dart';

class UserService {
  final _log = getLogger('UserService');

  UserDto? _currentUser;
  UserDto get currentUser => _currentUser!;

  set currentUser(UserDto? value) => _currentUser = value;

  bool get hasLoggedInUser => _currentUser != null;
}
