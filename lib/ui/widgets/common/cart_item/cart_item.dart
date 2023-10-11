import 'package:dionniebee/app/extensions/null_operators.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/ui/common/colors.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'cart_item.button.dart';

class CartItem extends StatelessWidget {
  final ProductDto product;
  final Function() onSelect;
  final Function() onAdd;
  final Function() onMinus;
  final Function() onDelete;
  final Size size;

  const CartItem(
    this.product, {
    super.key,
    required this.onAdd,
    required this.onMinus,
    required this.size,
    required this.onDelete,
    required this.onSelect,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              value: product.isSelected,
              onChanged: (d) {
                onSelect();
              }),
          hSpaceRegular,
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.grey.shade200,
              child: CachedNetworkImage(
                imageUrl: product.imageUrl.toString(),
                width: 70,
                height: 70,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Container(
                    color: kcLightGrey, child: const Icon(Icons.error)),
              ),
            ),
          ),
          hSpaceRegular,
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            product.name.toString(),
                            maxLines: 2,
                            style: const TextStyle().copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.varelaRound().fontFamily,
                            ),
                          ),
                          vSpaceSmall,
                          Opacity(
                            opacity: 0.8,
                            child: Text(
                                NumberFormat.simpleCurrency(locale: 'fil_PH')
                                    .format(product.price),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    hSpaceSmall,
                    Text(
                      NumberFormat.simpleCurrency(locale: 'fil_PH').format(
                        product.price?.imul(product.quantityInCart ?? 0) ?? 0,
                      ),
                      maxLines: 2,
                      style: const TextStyle().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.varelaRound().fontFamily,
                      ),
                    ),
                  ],
                ),
                vSpaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /*       Expanded(
                      child: Text(
                        "₱ ${product.price} x ${product.quantityInCart}",
                        maxLines: 1,
                        style: const TextStyle(fontSize: 14).copyWith(
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.varelaRound().fontFamily,
                        ),
                      ),
                    ),
                    hSpaceSmall, */
                    const Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*  InkWell(
                            onTap: () {
                              onDelete();
                            },
                            child: const Icon(
                              Icons.delete_rounded,
                            )) */
                      ],
                    )),
                    CartItemButton(
                        icon: Icons.remove_rounded, onUpdate: () => onMinus()),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Center(
                        child: Text(
                          "${product.quantityInCart}",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    CartItemButton(
                        icon: Icons.add_rounded, onUpdate: () => onAdd()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
