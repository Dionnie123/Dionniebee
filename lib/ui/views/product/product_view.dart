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
            child: Image.network(
              "https://images.unsplash.com/photo-1692733470142-bfa42928dc33?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
              fit: BoxFit.cover,
            ),
          ),
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
    viewModel.listenToPost(id);
    super.onViewModelReady(viewModel);
  }
}
