import 'package:dionniebee/app/extensions/color_extension.dart';
import 'package:dionniebee/ui/common/colors.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartBreakdown extends StatelessWidget {
  final num subTotal;
  const CartBreakdown({super.key, required this.subTotal});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kcPrimaryColorDark,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
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
                  " ${NumberFormat.simpleCurrency(locale: 'fil_PH').format(subTotal)} ",
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
                  " ${NumberFormat.simpleCurrency(locale: 'fil_PH').format(subTotal)} ",
                  style: TextStyle(color: kcPrimaryColor.darken()).copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
