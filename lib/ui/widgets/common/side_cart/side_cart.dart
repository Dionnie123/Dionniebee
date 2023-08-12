import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class SideCart extends StatelessWidget {
  final List<Widget> actionButtons;
  final Widget cartBreakdown;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  const SideCart(
      {super.key,
      required this.actionButtons,
      required this.cartBreakdown,
      required this.itemBuilder,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 500,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      )),
      child: Scaffold(
          //  backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            forceMaterialTransparency: true,
            actions: [
              ...actionButtons,
              hSpaceMedium,
            ],
          ),
          bottomSheet: cartBreakdown,
          body: Padding(
            padding: const EdgeInsets.only(bottom: 160),
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return itemBuilder(context, index);
              },
            ),
          )),
    );
  }
}
