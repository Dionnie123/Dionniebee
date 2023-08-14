import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function() onSignOut;
  final int cartCount;
  final Function() onCartTap;
  const AppBarWidget(
      {super.key,
      required this.onSignOut,
      required this.onCartTap,
      this.cartCount = 0});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Text(
        "DionnieBee",
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () async {
            onSignOut();
          },
        ),
        Builder(builder: (context) {
          return IconButton(
            icon: badges.Badge(
                position: badges.BadgePosition.custom(top: -15, end: -10),
                showBadge: cartCount > 0,
                badgeAnimation: const badges.BadgeAnimation.scale(),
                badgeContent: Text(
                  cartCount.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: const Icon(Icons.shopping_cart_rounded)),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          );
        }),
        hSpaceRegular,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
