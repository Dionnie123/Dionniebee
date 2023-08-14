import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/services/cart_service.dart';
import 'package:dionniebee/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String fuck = 'xxx';

class HomeViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final navService = locator<RouterService>();
  final _productService = locator<ProductService>();
  final _cartService = locator<CartService>();
  final _dialogService = locator<DialogService>();
  @override
  List<ListenableServiceMixin> get listenableServices => [
        _productService,
      ];

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

  Future start(bool showLoading) async {
    await runBusyFuture(_productService.fetchAll(), throwException: true);
  }

  Future addToCart(ProductDto product) async {
    await runBusyFuture(_cartService.addToCart(product), throwException: true);
  }

  addCartItemQuantity(int id) {
    _cartService.addCartItemQuantity(id);
  }

  minusCartItemQuantity(int id) {
    _cartService.minusCartItemQuantity(id);
  }

  signOut() async {
    await _authService.signOut();
    await navService.replaceWithAuthView();
  }

  num get cartTotal => _cartService.cartTotal;
  int get cartItemsQuantity => _cartService.cartItemsQuantity;
  List<ProductDto> get products => _productService.items;
  List<ProductDto> get cart => _cartService.cart;
}
