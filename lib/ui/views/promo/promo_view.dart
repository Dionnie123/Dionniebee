import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:dionniebee/ui/widgets/common/dashboard/widgets/app_bar_widget.dart';
import 'package:dionniebee/ui/widgets/common/dashboard/widgets/bottom_nav_widget.dart';
import 'package:dionniebee/ui/widgets/common/dashboard/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'horizontal_coupon_example_1.dart';
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
        body: LayoutBuilder(builder: (context, size) {
          return SingleChildScrollView(
            padding: scaffoldBodyPadding(size: size),
            child: const Column(
              children: [
                HorizontalCouponExample1(),
                vSpaceSmall,
                HorizontalCouponExample1(),
                vSpaceSmall,
                HorizontalCouponExample1(),
              ],
            ),
          );
        }));
  }

  @override
  PromoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PromoViewModel();
}
