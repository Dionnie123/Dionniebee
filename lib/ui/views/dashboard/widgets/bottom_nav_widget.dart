import 'package:dionniebee/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<DashboardViewModel>(context);

    int currentIndex = viewModel.currentIndex;
    return NavigationBar(
      onDestinationSelected: (i) =>
          i == viewModel.currentIndex ? null : viewModel.setIndex(i),
      selectedIndex: currentIndex,
      destinations: <Widget>[
        NavigationDestination(
          icon: Image.asset(
            'assets/icons/home.png',
            width: 24,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Image.asset(
            'assets/icons/promo.png',
            width: 24,
          ),
          label: 'Promo',
        ),
        NavigationDestination(
          icon: Image.asset(
            'assets/icons/orders.png',
            width: 24,
          ),
          label: 'Orders',
        ),
        NavigationDestination(
          icon: Image.asset(
            'assets/icons/shop.png',
            width: 24,
          ),
          label: 'Stores',
        ),
      ],
    );
  }
}
