import 'package:animations/animations.dart';
import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/ui/common/colors.dart';
import 'package:dionniebee/ui/views/dashboard/widgets/split_view.dart';
import 'package:dionniebee/ui/views/home/home_view.dart';
import 'package:dionniebee/ui/views/home/home_viewmodel.dart';
import 'package:dionniebee/ui/views/orders/orders_view.dart';
import 'package:dionniebee/ui/views/orders/orders_viewmodel.dart';
import 'package:dionniebee/ui/views/promo/promo_view.dart';
import 'package:dionniebee/ui/views/promo/promo_viewmodel.dart';
import 'package:dionniebee/ui/views/stores/stores_view.dart';
import 'package:dionniebee/ui/views/stores/stores_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({super.key});

  @override
  void onDispose(DashboardViewModel viewModel) {
    locator<HomeViewModel>().setOnModelReadyCalled(false);
    locator<HomeViewModel>().setInitialised(false);

    locator<PromoViewModel>().setOnModelReadyCalled(false);
    locator<OrdersViewModel>().setOnModelReadyCalled(false);
    locator<StoresViewModel>().setOnModelReadyCalled(false);
    locator<StoresViewModel>().setInitialised(false);
    super.onDispose(viewModel);
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView(
          key: ValueKey('HomeView'),
        );
      case 1:
        return const PromoView(
          key: ValueKey('PromoView'),
        );
      case 2:
        return const OrdersView(
          key: ValueKey('OrdersView'),
        );
      case 3:
        return const StoresView(
          key: ValueKey('StoresView'),
        );
      default:
        return const HomeView(
          key: ValueKey('HomeView'),
        );
    }
  }

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
        onWillPop: () async {
          viewModel.setIndex(0);

          return await Future.value(false);
        },
        child: SplitView(
            child: PageTransition(
                reverse: viewModel.reverse,
                child: getViewForIndex(viewModel.currentIndex))));
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      locator<DashboardViewModel>();
}

class PageTransition extends StatelessWidget {
  const PageTransition({
    super.key,
    required this.child,
    required this.reverse,
  });

  final bool reverse;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      reverse: reverse,
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (
        Widget child,
        Animation<double> primaryAnimation,
        Animation<double> secondaryAnimation,
      ) {
        return SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          fillColor: kcPrimaryColor,
          child: child,
        );
      },
      child: child,
    );
  }
}
