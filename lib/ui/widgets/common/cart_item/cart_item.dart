import 'package:dionniebee/app/extensions/null_operators.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cart_item.button.dart';

class CartItem extends StatelessWidget {
  final ProductDto product;
  final Function() onAdd;
  final Function() onMinus;
  final Size size;

  const CartItem(
    this.product, {
    super.key,
    required this.onAdd,
    required this.onMinus,
    required this.size,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      /*    width: size.width,
      height: size.height, */
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
              //margin: EdgeInsetsDirectional.zero,
              clipBehavior: Clip.antiAlias,
              //  elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: product.imageUrl.toString(),
                        width: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                    hSpaceSmall,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                      style: const TextStyle(fontSize: 16)
                                          .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily,
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.6,
                                      child: Text(
                                          product.description.toString(),
                                          style: const TextStyle(fontSize: 12)),
                                    ),
                                  ],
                                ),
                              ),
                              hSpaceSmall,
                              Text(
                                "₱${product.price?.imul(product.quantityInCart ?? 0)}",
                                maxLines: 2,
                                style: const TextStyle(fontSize: 16).copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.nunito().fontFamily,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "₱${product.price} x ${product.quantityInCart}",
                                  maxLines: 1,
                                  style: const TextStyle(fontSize: 14).copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                  ),
                                ),
                              ),
                              hSpaceSmall,
                              CartItemButton(
                                  icon: Icons.remove_rounded,
                                  onUpdate: () => onMinus()),
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    "${product.quantityInCart}",
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                              CartItemButton(
                                  icon: Icons.add_rounded,
                                  onUpdate: () => onAdd()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          const Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Row(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
