import 'package:dionniebee/services/loader_service.dart';

enum ToastType {
  welcome,
}

typedef ToastBuilder = Function();

class ToastService {
  Function(String? message)? showToast;
  Map<ToastType, ToastBuilder> _toastBuilders = <ToastType, ToastBuilder>{};
  void registerCustomToastBuilders(Map<ToastType, ToastBuilder> builders) {
    _toastBuilders = builders;
  }

  show(String message) {
    return showToast != null ? showToast!(message) : null;
  }
}
