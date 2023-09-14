import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/services/cart_service.dart';
import 'package:dionniebee/services/location_service.dart';
import 'package:dionniebee/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String _productsStreamKey = 'products-stream';

class HomeViewModel extends MultipleStreamViewModel {
  final locationService = locator<LocationService>();
  final _authService = locator<AuthService>();
  final _navService = locator<RouterService>();
  final _productService = locator<ProductService>();
  final _cartService = locator<CartService>();
  final _dialogService = locator<DialogService>();

  int get cartCount => _cartService.cartCount;
  num get cartTotal => _cartService.cartTotal;
  List<ProductDto> get cart => _cartService.cart;

  List<ProductDto> _products = [];
  List<ProductDto> get products => _products;

  @override
  Map<String, StreamData> get streamsMap => {
        _productsStreamKey:
            StreamData<List<ProductDto>>(_productService.getItemsStream())
      };

  @override
  void onData(String key, data) {
    _products = dataMap?[_productsStreamKey];
    super.onData(key, data);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_cartService];

  @override
  void onFutureError(error, Object? key) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dialogService.showDialog(
          title: "Error",
          barrierDismissible: true,
          description: error.toString(),
          dialogPlatform: DialogPlatform.Custom);
    });
    super.onFutureError(error, key);
  }

  addToCart(ProductDto product) {
    _cartService.addToCart(product);
  }

  addCartItemQuantity(String id) {
    _cartService.addCartItemQuantity(id);
  }

  minusCartItemQuantity(String id) {
    _cartService.minusCartItemQuantity(id);
  }

  productView(String id) {
    _navService.navigateToProductView(id: id.toString(), key: UniqueKey());
  }

  signOut() async {
    await _authService.signOut();
    await _navService.replaceWithAuthView();
  }
}
