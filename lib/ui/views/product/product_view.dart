import 'package:cached_network_image/cached_network_image.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'product_viewmodel.dart';

class ProductView extends StackedView<ProductViewModel> {
  final String? id;
  const ProductView({
    super.key,
    this.id,
  });

  @override
  Widget builder(
    BuildContext context,
    ProductViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: LayoutBuilder(builder: (context, size) {
        return SingleChildScrollView(
          padding: scaffoldBodyPadding(
              size: size, targetWidth: 400, vPadding: 15, hPadding: 15),
          child: Column(
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
              vSpaceRegular,
              Text(
                "${viewModel.product?.name}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              vSpaceSmall,
              Text("${viewModel.product?.description}"),
            ],
          ),
        );
      }),
    );
  }

  @override
  ProductViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductViewModel();

  @override
  void onViewModelReady(ProductViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  bool get initialiseSpecialViewModelsOnce => true;
}
