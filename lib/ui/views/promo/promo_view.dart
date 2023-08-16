import 'package:dionniebee/ui/widgets/common/dashboard/widgets/app_bar_widget.dart';
import 'package:dionniebee/ui/widgets/common/dashboard/widgets/bottom_nav_widget.dart';
import 'package:dionniebee/ui/widgets/common/dashboard/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'promo_viewmodel.dart';

class PromoView extends StackedView<PromoViewModel> {
  const PromoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PromoViewModel viewModel,
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
      bottomNavigationBar: const NavigationBarWidget(selectedIndex: 1),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
          padding: const EdgeInsets.only(
            left: 25.0,
            right: 25.0,
          ),
          child: const Text("Promo")),
    );
  }

  @override
  PromoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PromoViewModel();
}
