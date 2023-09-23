import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:dionniebee/ui/special/ez_button.dart';
import 'package:dionniebee/ui/widgets/common/cart/cart.dart';
import 'package:dionniebee/ui/widgets/common/cart_item/cart_item.dart';
import 'package:dionniebee/ui/widgets/common/cart_listview/cart_breakdown.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'cart_viewmodel.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CartViewModel viewModel,
    Widget? child,
  ) {
    return viewModel.cart.isEmpty
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Cart"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  const Icon(
                    Icons.shopping_bag_rounded,
                    size: 60,
                  ),
                  vSpaceSmall,
                  const Text(
                    "It's Empty Here",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  vSpaceSmall,
                  const Text(
                    "You haven't added anything to you cart yet! Go back to the menu to start ordering.",
                    textAlign: TextAlign.center,
                  ),
                  vSpaceMedium,
                  EzButton(title: "Go back to menu", onPressed: () {})
                ],
              ),
            ),
          )
        : Cart(
            items: viewModel.cart,
            actionButtons: const [],
            cartBreakdown: CartBreakdown(subTotal: viewModel.cartTotal),
            itemBuilder: (context, index) {
              return CartItem(
                viewModel.cart[index],
                onAdd: () {
                  viewModel.addCartItemQuantity(viewModel.cart[index].id ?? "");
                },
                onMinus: () {
                  viewModel
                      .minusCartItemQuantity(viewModel.cart[index].id ?? "");
                },
                size: const Size(double.infinity, 150),
              );
            },
          );
  }

  @override
  CartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartViewModel();
}
