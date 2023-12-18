import 'package:animations/animations.dart';
import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/ui/views/dashboard/widgets/split_view.dart';
import 'package:dionniebee/ui/views/home/home_view.dart';
import 'package:dionniebee/ui/views/home/home_viewmodel.dart';
import 'package:dionniebee/ui/views/orders/orders_view.dart';
import 'package:dionniebee/ui/views/orders/orders_viewmodel.dart';
import 'package:dionniebee/ui/views/promo/promo_view.dart';
import 'package:dionniebee/ui/views/promo/promo_viewmodel.dart';
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
    final pages = [
      const HomeView(
        key: ValueKey(0),
      ),
      const PromoView(
        key: ValueKey(1),
      ),
      const OrdersView(
        key: ValueKey(2),
      ),
      const HomeView(
        key: ValueKey(3),
      )
    ];

    return pages.elementAt(index);
  }

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    viewModel.welcome();
    return WillPopScope(
            onWillPop: () async {
              viewModel.setIndex(0);

              return await Future.value(false);
            },
            child: SplitView(child: getViewForIndex(viewModel.currentIndex)))

        /*    AnimatedSwitcher(
                  key: ValueKey<int>(viewModel.currentIndex),
                duration: const Duration(milliseconds: 300),
                child: getViewForIndex(viewModel.currentIndex)) */

        /*  PageTransition(
                index: viewModel.currentIndex,
                reverse: viewModel.reverse,
                child: getViewForIndex(viewModel.currentIndex)) */
        ;
  }

  @override
  Future<void> onViewModelReady(DashboardViewModel viewModel) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.welcome();
    });
    super.onViewModelReady(viewModel);
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
    required this.index,
  });

  final bool reverse;
  final int index;
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
          fillColor: Colors.red,
          child: child,
        );
      },
      child: child,
    );
  }
}
