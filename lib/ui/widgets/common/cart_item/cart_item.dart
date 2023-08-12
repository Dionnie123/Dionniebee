import 'package:dionniebee/app/extensions/color_extension.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/ui/common/colors.dart';
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
                clipBehavior: Clip.antiAlias,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://images.unsplash.com/photo-1541167760496-1628856ab772?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1637&q=80',
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          width: 80,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      hSpaceSmall,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              product.name.toString(),
                              maxLines: 2,
                              style: const TextStyle(fontSize: 16).copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.nunito().fontFamily,
                              ),
                            ),
                            Opacity(
                              opacity: 0.6,
                              child: Text(product.description.toString(),
                                  maxLines: 2,
                                  style: const TextStyle(fontSize: 14)),
                            ),
                            Text(
                              "\$${product.price} x ${product.quantityInCart}",
                              maxLines: 1,
                              style: const TextStyle(fontSize: 14).copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.nunito().fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                      hSpaceSmall,
                      CartItemButton(
                          icon: Icons.remove_rounded,
                          onUpdate: () => onMinus()),
                      Card(
                        color: kcPrimaryColor.darken(),
                        child: SizedBox(
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
                      ),
                      CartItemButton(
                          icon: Icons.add_rounded, onUpdate: () => onAdd()),
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
      ),
    );
  }
}
