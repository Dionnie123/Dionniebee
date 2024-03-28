import 'package:collection/collection.dart';
import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/global/colors.dart';
import 'package:dionniebee/global/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class CartList extends StatelessWidget {
  final List<Widget> actionButtons;
  final Widget cartBreakdown;
  final List<ProductDto> items;
  final Widget Function(BuildContext context, int index) itemBuilder;
  const CartList(
      {super.key,
      required this.actionButtons,
      required this.cartBreakdown,
      required this.itemBuilder,
      this.items = const []});

  @override
  Widget build(BuildContext context) {
    final List<Widget> x = [];

    items.forEachIndexed((i, el) {
      x.add(itemBuilder(context, i));
      if (i != items.length - 1) {
        x.add(Divider(
          height: 0.0,
          color: Colors.grey.shade300,
        ));
      } else {}
    });

    return LayoutBuilder(builder: (context, size) {
      Widget emptyCart() {
        return Center(
          child: Padding(
            padding: fluidPadding(size: size, vPadding: 15, hPadding: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_bag_outlined,
                  size: 40,
                ),
                vSpaceSmall,
                const Text(
                  "It's empty here",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                vSpaceMedium,
                const Text(
                  "You haven't added anything to you cart yet! \nGo back to the menu to start ordering.",
                  textAlign: TextAlign.center,
                ),
                vSpaceMedium,
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(kcPrimary)),
                  onPressed: () async {
                    locator<RouterService>().pop();
                  },
                  child: const Text(
                    "Order Now",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        );
      }

      return items.isEmpty
          ? emptyCart()
          : SingleChildScrollView(
              padding: fluidPadding(size: size, hPadding: 8, vPadding: 8),
              child: Column(
                children: [
                  Card(
                    elevation: 2,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Column(
                      children: [
                        Column(
                          children: x,
                        ),
                        cartBreakdown,
                      ],
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
