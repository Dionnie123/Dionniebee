import 'package:dionniebee/app/models/product_dto.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class ProductMenuListView extends StatelessWidget {
  final Size size;
  final List<ProductDto> products;
  final bool isBusy;
  final Widget? Function(BuildContext, int) loadingItemBuilder;
  final Widget? Function(BuildContext, int) itemBuilder;
  const ProductMenuListView({
    super.key,
    required this.products,
    required this.itemBuilder,
    required this.size,
    required this.loadingItemBuilder,
    this.isBusy = false,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: isBusy
            ? ListView.builder(
                itemCount: 12,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return loadingItemBuilder(context, index);
                },
              )
            : ListView.builder(
                primary: false,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) => itemBuilder(context, index)),
      ),
    );
  }
}
