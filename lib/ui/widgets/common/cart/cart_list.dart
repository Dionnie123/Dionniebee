import 'package:collection/collection.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:dionniebee/ui/special/ez_button.dart';
import 'package:flutter/material.dart';

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
            padding:
                scaffoldBodyPadding(size: size, vPadding: 15, hPadding: 15),
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
                  "It's Empty Here",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                vSpaceSmall,
                const Text(
                  "You haven't added anything to you cart yet! \nGo back to the menu to start ordering.",
                  textAlign: TextAlign.center,
                ),
                vSpaceMedium,
                ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {},
                    child: const Text("Go back to menu"))
              ],
            ),
          ),
        );
      }

      return items.isEmpty
          ? emptyCart()
          : SingleChildScrollView(
              padding:
                  scaffoldBodyPadding(size: size, hPadding: 8, vPadding: 8),
              child: Column(
                children: [
                  Card(
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
