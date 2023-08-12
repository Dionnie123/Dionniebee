import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_model.dart';

class Dashboard extends StackedView<DashboardModel> {
  const Dashboard({super.key});

  @override
  Widget builder(
    BuildContext context,
    DashboardModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  DashboardModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardModel();
}
