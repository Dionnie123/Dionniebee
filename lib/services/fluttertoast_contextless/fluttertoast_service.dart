enum ToastType {
  welcome,
}

typedef ToastBuilder = Function();

class FlutterToastService {
  var _toastCustomBuilders = <ToastType, ToastBuilder>{};

  ToastBuilder? welcomeToast;
  Function(String? message)? showToast;

  void registerCustomToastBuilders(Map<ToastType, ToastBuilder> builders) {
    _toastCustomBuilders = builders;
  }

  show(String message) {
    return showToast != null ? showToast!(message) : null;
  }

  welcome(ToastType type) {
    return _toastCustomBuilders[ToastType.welcome]?.call();
  }
}
