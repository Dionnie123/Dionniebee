import 'package:dionniebee/ui/widgets/common/my_map/my_map.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'stores_viewmodel.dart';

class StoresView extends StackedView<StoresViewModel> {
  const StoresView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StoresViewModel viewModel,
    Widget? child,
  ) {
    return const MyMap();
  }

  @override
  StoresViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StoresViewModel();
}
