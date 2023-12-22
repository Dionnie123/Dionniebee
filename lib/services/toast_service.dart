enum ToastType {
  welcome,
}

typedef ToastBuilder = Function();

class ToastService {
  Map<ToastType, ToastBuilder> _toastBuilders = <ToastType, ToastBuilder>{};
  void registerCustomToastBuilders(Map<ToastType, ToastBuilder> builders) {
    _toastBuilders = builders;
  }

  show(ToastType type) {
    return _toastBuilders[type]?.call();
  }
}
