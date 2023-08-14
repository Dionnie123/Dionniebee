import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/app/helpers/offline_checker.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class NavigationBarWidget extends StatelessWidget {
  final int? selectedIndex;

  const NavigationBarWidget({super.key, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) async {
        if (index == 0) {
          locator<RouterService>().replaceWithHomeView();
        } else if (index == 1) {
          locator<RouterService>().replaceWithPromoView();
        } else if (index == 2) {
          locator<RouterService>().replaceWithOrdersView();
        }
        if (index == 3) {
          if (await hasNetwork() == true) {
            locator<RouterService>().navigateToStoresView();
          }
        }
      },
      selectedIndex: selectedIndex ?? 0,
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
