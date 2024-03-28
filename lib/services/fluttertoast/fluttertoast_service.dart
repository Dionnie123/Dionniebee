enum ToastType {
  welcome,
}

typedef ToastBuilder = Function();

/// Usage: _toastService.show("Dionniebee 2024");
///  _toastService.welcome();
/// _toastService.clear();
class FlutterToastService {
  var _toastCustomBuilders = <ToastType, ToastBuilder>{};

  void registerCustomToastBuilders(Map<ToastType, ToastBuilder> builders) {
    _toastCustomBuilders = builders;
  }

  ToastBuilder? welcomeToast;

  Function clear = () {};

  welcome(ToastType type) {
    return _toastCustomBuilders[ToastType.welcome]?.call();
  }

  Function(String? message)? showToast;
  show(String message) {
    return showToast != null ? showToast!(message) : null;
  }
}
