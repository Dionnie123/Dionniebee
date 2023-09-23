import 'package:dionniebee/app/extensions/color_extension.dart';
import 'package:dionniebee/ui/common/colors.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:dionniebee/ui/special/ez_button.dart';
import 'package:flutter/material.dart';

class CartBreakdown extends StatelessWidget {
  final num subTotal;
  const CartBreakdown({super.key, required this.subTotal});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown.shade400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SUBTOTAL",
                  style: const TextStyle().copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "₱ ${subTotal.toStringAsFixed(2)}",
                  style: const TextStyle().copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            vSpaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL",
                  style: TextStyle(color: kcPrimaryColor.darken()).copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "₱ ${subTotal.toStringAsFixed(2)}",
                  style: TextStyle(color: kcPrimaryColor.darken()).copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            vSpaceRegular,
            EzButton(onPressed: () {}, title: "Go to Checkout")
          ],
        ),
      ),
    );
  }
}
