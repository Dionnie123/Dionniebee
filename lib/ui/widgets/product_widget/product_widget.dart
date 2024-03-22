import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/ui/common/colors.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:firebase_cached_image/firebase_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'product_widget_model.dart';

// Form that makes use of the ViewModel provided above but also makes use of hooks

class ProductWidget extends StackedView<ProductWidgetModel> {
  final Function() onTap;
  final Function() onAdd;
  final Function() onFavorite;
  final ProductDto product;
  final Size size;

  const ProductWidget(
    this.product, {
    super.key,
    required this.size,
    required this.onAdd,
    required this.onTap,
    required this.onFavorite,
  });

  @override
  Widget builder(
    BuildContext context,
    ProductWidgetModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () async {
        onAdd();
        await viewModel.toggleAddedToCartOverlay();
      },
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Card(
                    margin: const EdgeInsets.all(0),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.antiAlias,
                          children: [
                            Image(
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              image: FirebaseImageProvider(
                                FirebaseUrl(product.imageUrl.toString()),
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
                                    height: 120,
                                    width: double.infinity,
                                  );
                                }
                              },
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
                            color: kcPrimaryAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.name.toString(),
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white)),
                                      vSpaceTiny,
                                      Opacity(
                                        opacity: 0.6,
                                        child: Text(
                                            product.description.toString(),
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
                                          Text("\$${product.price}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white)),
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
            opacity: viewModel.addedToCartOverlayVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.decelerate,
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Card(
                  margin: EdgeInsets.zero,
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
            opacity: viewModel.addedToFavoritesOverlayVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.decelerate,
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Card(
                  margin: EdgeInsets.zero,
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
                onPressed: () async {
                  onFavorite();
                  await viewModel.toggleAddedToFavoritesOverlay();
                },
                icon: Icon(
                  viewModel.isFavorite
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }

  @override
  bool get fireOnViewModelReadyOnce => true;

  @override
  ProductWidgetModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductWidgetModel();
}
