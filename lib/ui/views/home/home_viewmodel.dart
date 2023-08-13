import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/services/shopping_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String fuck = 'xxx';

class HomeViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final navService = locator<RouterService>();
  final _shopService = locator<ShoppingService>();
  final _dialogService = locator<DialogService>();
  @override
  List<ListenableServiceMixin> get listenableServices => [
        _shopService,
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
    if (showLoading) {
      await runBusyFuture(_shopService.fetchAllProducts(),
          throwException: true);
    } else {
      await Future.value([
        _shopService.fetchAllProducts(),
        await Future.delayed(const Duration(milliseconds: 500))
      ]);
    }
  }

  Future addToCart(ProductDto product) async {
    await runBusyFuture(_shopService.addToCart(product), throwException: true);
  }

  addCartItemQuantity(int id) {
    _shopService.addCartItemQuantity(id);
  }

  minusCartItemQuantity(int id) {
    _shopService.minusCartItemQuantity(id);
  }

  signOut() async {
    await _authService.signOut();
    await navService.replaceWithAuthView();
  }

  num get cartTotal => _shopService.cartTotal;
  int get cartItemsQuantity => _shopService.cartItemsQuantity;
  List<ProductDto> get products => _shopService.products;
  List<ProductDto> get cart => _shopService.cart;
}
