import 'package:dionniebee/app/models/product_dto.dart';
import 'package:flutter/material.dart';

class ProductMenuListView extends StatelessWidget {
  final Size size;
  final List<ProductDto> products;

  final Widget? Function(BuildContext, int) itemBuilder;
  const ProductMenuListView({
    super.key,
    required this.products,
    required this.itemBuilder,
    required this.size,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: ListView.builder(
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
