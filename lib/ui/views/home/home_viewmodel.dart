import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/services/shopping_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String fuck = 'xxx';

class HomeViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final navService = locator<RouterService>();
  final _shopService = locator<ShoppingService>();
  @override
  List<ListenableServiceMixin> get listenableServices => [
        _shopService,
      ];

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
    if (!kIsWeb) FlutterNativeSplash.remove();
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
