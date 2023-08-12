import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'foo_view.desktop.dart';
import 'foo_view.tablet.dart';
import 'foo_view.mobile.dart';
import 'foo_viewmodel.dart';

class FooView extends StackedView<FooViewModel> {
  const FooView({super.key});

  @override
  Widget builder(
    BuildContext context,
    FooViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const FooViewMobile(),
      tablet: (_) => const FooViewTablet(),
      desktop: (_) => const FooViewDesktop(),
    );
  }

  @override
  FooViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FooViewModel();
}
