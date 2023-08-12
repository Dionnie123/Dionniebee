import 'package:dionniebee/app/models/product_dto.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  final Function() onTap;
  final Function() onAdd;
  final ProductDto product;
  final Size size;
  const ProductItem(
    this.product, {
    super.key,
    required this.size,
    required this.onAdd,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Center(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.antiAlias,
                      children: [
                        CachedNetworkImage(
                          imageUrl: product.imageUrl.toString(),
                          placeholder: (context, url) => Container(
                            color: Theme.of(context).primaryColor,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        /*   Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                              color: Colors.red,
                              child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  child: Text(
                                    "NEW!",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ))),
                        ) */
                      ],
                    ),
                    Expanded(
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.name.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                        fontSize: 16, color: Colors.white)
                                    .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                      GoogleFonts.quicksand().fontFamily,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Opacity(
                                    opacity: 0.6,
                                    child: Text(product.description.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.white)),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    "\$${product.price}",
                                    style: const TextStyle(
                                            fontSize: 16, color: Colors.white)
                                        .copyWith(
                                      fontWeight: FontWeight.w900,
                                      fontFamily:
                                          GoogleFonts.nunito().fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
