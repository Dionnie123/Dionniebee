import 'package:stacked/stacked.dart';

class ValidationExampleViewModel extends BaseViewModel {
  String _email = '';
  String _mobileNumber = '';
  String _name = '';

  bool get canSubmit =>
      _name.length > 3 && (isValidEmail(_email) || _mobileNumber.length > 3);

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setMobileNumber(String mobileNumber) {
    _mobileNumber = mobileNumber;
    notifyListeners();
  }
}

bool isValidEmail(String email) {
  // Regular expression for a simple email validation
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

  return emailRegex.hasMatch(email);
}
