import 'package:collection/collection.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  final List<Widget> actionButtons;
  final Widget cartBreakdown;
  final List<ProductDto> items;
  final Widget Function(BuildContext context, int index) itemBuilder;
  const Cart(
      {super.key,
      required this.actionButtons,
      required this.cartBreakdown,
      required this.itemBuilder,
      this.items = const []});

  @override
  Widget build(BuildContext context) {
    final List<Widget> x = [];
    x.add(const Divider(
      color: Colors.transparent,
    ));
    items.forEachIndexed((i, el) {
      x.add(itemBuilder(context, i));
      if (i != items.length - 1) {
        x.add(const Divider());
      } else {
        x.add(const Divider(
          color: Colors.transparent,
        ));
      }
    });

    x.add(cartBreakdown);

    return Scaffold(
        backgroundColor: Colors.yellow.shade100,
        appBar: AppBar(
          actions: [
            ...actionButtons,
            hSpaceMedium,
          ],
        ),
        //   bottomSheet: cartBreakdown,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 2,
            child: Column(
              children: x,
            ),
          ),
        ));
  }
}
