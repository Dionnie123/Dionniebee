import 'package:dionniebee/app/models/product_dto.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dionniebee/ui/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatefulWidget {
  final Function() onTap;
  final Function() onAdd;
  final Function() onFavorite;
  final ProductDto product;
  final Size size;
  const ProductItem(
    this.product, {
    super.key,
    required this.size,
    required this.onAdd,
    required this.onTap,
    required this.onFavorite,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool addedToCartOverlayVisible = false;
  bool addedToFavoritesOverlayVisible = false;
  bool isFavorite = false;

  toggleAddedToCartOverlay() {
    widget.onAdd();
    setState(() {
      addedToCartOverlayVisible = true;
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          addedToCartOverlayVisible = false;
        });
      });
    });
  }

  toggleAddedToFavoritesOverlay() {
    widget.onFavorite();
    setState(() {
      addedToFavoritesOverlayVisible = true;
      isFavorite = true;
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          addedToFavoritesOverlayVisible = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggleAddedToCartOverlay(),
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              width: widget.size.width,
              height: widget.size.height,
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
                              imageUrl: widget.product.imageUrl.toString(),
                              placeholder: (context, url) =>
                                  Container(color: kcLightGrey),
                              errorWidget: (context, url, error) => Container(
                                color: kcLightGrey,
                                child: const Icon(Icons.error),
                              ),
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                    color: Colors.red,
                                    child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 4.0),
                                        child: Text(
                                          "NEW!",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ))),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            color: Theme.of(context).primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    direction: Axis.vertical,
                                    spacing: 10,
                                    runSpacing: 8.0,
                                    children: [
                                      Text(
                                        widget.product.name.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white)
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: GoogleFonts.quicksand()
                                              .fontFamily,
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.6,
                                        child: Text(
                                            widget.product.description
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "\$${widget.product.price}",
                                            style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white)
                                                .copyWith(
                                              fontWeight: FontWeight.w900,
                                              fontFamily:
                                                  GoogleFonts.varelaRound()
                                                      .fontFamily,
                                            ),
                                          ),
                                        ],
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
          AnimatedOpacity(
            opacity: addedToCartOverlayVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.decelerate,
            child: SizedBox(
              width: widget.size.width,
              height: widget.size.height,
              child: Card(
                  color: Colors.black.withOpacity(0.5),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_rounded,
                        size: 50,
                        color: Colors.white,
                      ),
                    ],
                  )),
            ),
          ),
          AnimatedOpacity(
            opacity: addedToFavoritesOverlayVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.decelerate,
            child: SizedBox(
              width: widget.size.width,
              height: widget.size.height,
              child: Card(
                  color: Colors.black.withOpacity(0.5),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_rounded,
                        size: 50,
                        color: Colors.white,
                      ),
                    ],
                  )),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
                onPressed: () {
                  toggleAddedToFavoritesOverlay();
                },
                icon: Icon(
                  isFavorite
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
