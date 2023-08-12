import 'package:dionniebee/app/models/product_dto.dart';
import 'package:flutter/material.dart';

class CartListview extends StatelessWidget {
  final List<ProductDto> products;
  final Widget? Function(BuildContext, int) itemBuilder;
  const CartListview(
      {super.key, required this.products, required this.itemBuilder});

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: products.length,
        itemBuilder: (context, index) => itemBuilder(context, index));
  }
}
