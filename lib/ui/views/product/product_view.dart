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
          Card(
              child: Row(children: [
            CachedNetworkImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1687360441372-757f8b2b6835?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
              fit: BoxFit.cover,
            ),
            const Expanded(
              child: Text('Product Name'),
            ),
          ])),
          AspectRatio(
              aspectRatio: 4 / 3,
              child: CachedNetworkImage(
                imageUrl: "${viewModel.product?.imageUrl}",
                fit: BoxFit.cover,
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
