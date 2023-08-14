import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/services/cart_service.dart';
import 'package:dionniebee/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PromoViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final navService = locator<RouterService>();
  final _productService = locator<ProductService>();
  final _cartService = locator<CartService>();
  final _dialogService = locator<DialogService>();
  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_productService, _cartService];

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
