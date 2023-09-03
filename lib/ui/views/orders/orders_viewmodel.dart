import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/services/cart_service.dart';
import 'package:dionniebee/services/order_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String _numStreamKey = 'num-stream';

class OrdersViewModel extends MultipleStreamViewModel {
  OrderService orderService = locator<OrderService>();
  final _authService = locator<AuthService>();
  final navService = locator<RouterService>();

  final _cartService = locator<CartService>();
  final _dialogService = locator<DialogService>();

  num? get number => dataMap?[_numStreamKey];

  @override
  Map<String, StreamData> get streamsMap => {
        _numStreamKey: StreamData<num>(orderService.getNumStream),
      };

  @override
  List<ListenableServiceMixin> get listenableServices => [_cartService];

  void start() {
    orderService.startStream(0);
    notifySourceChanged(clearOldData: true);
  }

  @override
  void onFutureError(error, Object? key) {
    super.onFutureError(error, key);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dialogService.showDialog(
          title: "Error",
          barrierDismissible: true,
          description: error.toString(),
          dialogPlatform: DialogPlatform.Custom);
    });
  }

  signOut() async {
    await _authService.signOut();
    await navService.replaceWithAuthView();
  }

  int get cartCount => _cartService.cartCount;
}
