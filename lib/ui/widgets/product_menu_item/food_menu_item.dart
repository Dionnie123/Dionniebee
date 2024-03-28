import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/global/colors.dart';
import 'package:firebase_cached_image/firebase_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodMenuItem extends StatelessWidget {
  final Function() onTap;
  final Function() onAdd;
  final ProductDto product;
  final Size size;
  const FoodMenuItem(
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
          child: Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.antiAlias,
                      children: [
                        Image(
                          height: 108,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          image: FirebaseImageProvider(
                            FirebaseUrl(product.featuredImage),
                            options: const CacheOptions(
                              checkForMetadataChange: true,
                            ),
                          ),
                          errorBuilder: (context, url, error) => Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.error),
                          ),
                          loadingBuilder: (_, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              // Show the loaded image if loading is complete.
                              return child;
                            } else {
                              // Show a loading indicator with progress information.
                              return Container(
                                color: Colors.grey[300],
                                height: 108,
                                width: double.infinity,
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ],
                ),
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.15,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ).copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.quicksand().fontFamily,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.8),
                            offset: const Offset(1, 1),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
