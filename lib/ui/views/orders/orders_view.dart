import 'package:dionniebee/ui/widgets/common/dashboard/widgets/app_bar_widget.dart';
import 'package:dionniebee/ui/widgets/common/dashboard/widgets/bottom_nav_widget.dart';
import 'package:dionniebee/ui/widgets/common/dashboard/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'orders_viewmodel.dart';

class OrdersView extends StackedView<OrdersViewModel> {
  const OrdersView({super.key});

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
      drawer: const DrawerWidget(),
      bottomNavigationBar: const NavigationBarWidget(selectedIndex: 2),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Text(viewModel.number.toString()),
          ElevatedButton(
              onPressed: () {
                viewModel.start();
              },
              child: const Text("START")),
          ElevatedButton(
              onPressed: () {
                viewModel.orderService.pauseStream();
              },
              child: const Text("PAUSE")),
          ElevatedButton(
              onPressed: () {
                viewModel.orderService.restartStream();
              },
              child: const Text("RESTART")),
          ElevatedButton(
              onPressed: () {
                viewModel.orderService.stopStream();
              },
              child: const Text("STOP")),
          Container(
              padding: const EdgeInsets.only(
                left: 25.0,
                right: 25.0,
              ),
              child: const Text("Orders")),
        ],
      ),
    );
  }

  @override
  OrdersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrdersViewModel();
}
