import 'package:dionniebee/ui/special/ez_button.dart';
import 'package:dionniebee/ui/widgets/common/cart/cart_list.dart';
import 'package:dionniebee/ui/widgets/common/cart/cart_item.dart';
import 'package:dionniebee/ui/widgets/common/cart/cart_list.breakdown.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'cart_viewmodel.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({super.key});

  @override
  Widget builder(
    BuildContext context,
    CartViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        bottomSheet: viewModel.cart.isEmpty
            ? null
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: EzButton(
                    title: "Checkout",
                    onPressed: () async {
                      await viewModel.checkout();
                    }),
              ),
        body: CartList(
          items: viewModel.cart,
          actionButtons: const [],
          cartBreakdown: CartBreakdown(subTotal: viewModel.cartTotal),
          itemBuilder: (context, index) {
            return CartItem(
              viewModel.cart[index],
              onSelect: () {
                viewModel.toggleSelect(viewModel.cart[index].id ?? "");
              },
              onAdd: () {
                viewModel.addCartItemQuantity(viewModel.cart[index].id ?? "");
              },
              onMinus: () {
                viewModel.minusCartItemQuantity(viewModel.cart[index].id ?? "");
              },
              onDelete: () {
                viewModel.deleteFromCart(viewModel.cart[index].id ?? "");
              },
              size: const Size(double.infinity, 150),
            );
          },
        ));
  }

  @override
  CartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartViewModel();
}
