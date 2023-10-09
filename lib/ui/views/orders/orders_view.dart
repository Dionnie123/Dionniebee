import 'package:dionniebee/ui/widgets/common/dashboard/widgets/app_bar_widget.dart';
import 'package:dionniebee/ui/widgets/common/dashboard/widgets/bottom_nav_widget.dart';
import 'package:dionniebee/ui/widgets/common/dashboard/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'orders_viewmodel.dart';

class OrdersView extends StackedView<OrdersViewModel> {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OrdersViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBarWidget(
        onCartTap: () {
          Scaffold.of(context).openEndDrawer();
        },
        onSignOut: () async {
          await viewModel.signOut();
        },
        cartCount: viewModel.cartCount,
      ),
      drawer: const DrawerWidget(selectedIndex: 2),
      bottomNavigationBar: const NavigationBarWidget(selectedIndex: 2),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
          padding: const EdgeInsets.only(
            left: 25.0,
            right: 25.0,
          ),
          child: const Text("Orders")),
    );
  }

  @override
  OrdersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrdersViewModel();
}
