import 'package:dionniebee/app/models/product_dto.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dionniebee/ui/common/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

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
    Future<String?> getDownloadUrlFromPath(String? imagePath) async {
      try {
        var storageReference =
            FirebaseStorage.instance.ref().child("$imagePath");

        var downloadURL = await storageReference.getDownloadURL();
        return downloadURL;
      } catch (e) {
        print('Error getting download URL from Firebase Storage: $e');
        return null;
      }
    }

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
                        FutureBuilder<String?>(
                            future: getDownloadUrlFromPath(product.imageUrl),
                            builder: (context, snapshot) {
                              return CachedNetworkImage(
                                imageUrl: "${snapshot.data}",
                                placeholder: (context, url) =>
                                    Container(color: kcLightGrey),
                                errorWidget: (context, url, error) => Container(
                                    color: kcLightGrey,
                                    child: const Icon(Icons.error)),
                                height: 108,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            }),
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
                      product.name.toString(),
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
