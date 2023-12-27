import 'package:dionniebee/app/app.bottomsheets.dart';
import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/services/cart_service.dart';
import 'package:dionniebee/ui/views/product/product_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends ReactiveViewModel {
  final _cartService = locator<CartService>();
  final _navService = locator<RouterService>();
  final _bService = locator<BottomSheetService>();
  final x = locator<AuthService>();

  num get cartCount => _cartService.cartCount;
  num get cartTotal => _cartService.cartTotal;
  List<ProductDto> get cart => _cartService.cart;

  @override
  List<ListenableServiceMixin> get listenableServices => [_cartService];

  checkout() async {
    await _cartService.addOrder();
  }

  cartInfo() async {
    await _bService.showCustomSheet(variant: BottomSheetType.cartInfo);
  }

  addCartItemQuantity(String id) {
    _cartService.addCartItemQuantity(id);

    notifyListeners();
  }

  toggleSelect(String id) {
    _cartService.toggleSelectCartItem(id);
    notifyListeners();
  }

  deleteFromCart(String id) {
    _cartService.deleteFromCart(id);
    notifyListeners();
  }

  minusCartItemQuantity(String id) {
    _cartService.minusCartItemQuantity(id);
    notifyListeners();
  }

  productView(String id) async {
    await _navService.navigateWithTransition(ProductView(
      id: id,
      key: UniqueKey(),
    ));
  }
}
