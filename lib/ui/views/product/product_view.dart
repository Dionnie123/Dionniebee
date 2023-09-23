import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'product_viewmodel.dart';

class ProductView extends StackedView<ProductViewModel> {
  final String id;
  const ProductView(this.id, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          AspectRatio(
              aspectRatio: 4 / 3,
              child: CachedNetworkImage(
                imageUrl: "${viewModel.product?.imageUrl}",
                fit: BoxFit.contain,
                placeholder: (context, url) {
                  return const SizedBox.shrink();
                },
                errorWidget: (context, s, d) {
                  return const SizedBox.shrink();
                },
              )),
          Text("${viewModel.product?.name}"),
          Text("${viewModel.product?.description}"),
          Container(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Text(viewModel.product.toString()),
          ),
        ],
      ),
    );
  }

  @override
  ProductViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductViewModel();

  @override
  void onViewModelReady(ProductViewModel viewModel) {
    viewModel.productId = id;
    super.onViewModelReady(viewModel);
  }
}
