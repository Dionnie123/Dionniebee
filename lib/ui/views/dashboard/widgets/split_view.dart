import 'package:dionniebee/ui/views/dashboard/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'bottom_nav_widget.dart';

class SplitView extends StatelessWidget {
  final int selectedIndex;
  final Widget child;
  const SplitView({
    super.key,
    required this.child,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 500 + 280) {
      // wide screen: menu on the left, content on the right
      return Row(
        children: [
          const SizedBox(
            width: 280,
            child: DrawerWidget(),
          ),
          //   Container(width: 0.5, color: Colors.black),
          Expanded(child: child),
        ],
      );
    } else {
      // narrow screen: show content, menu inside drawer
      return Scaffold(
        body: child,
        drawer: const SizedBox(
          width: 280,
          child: DrawerWidget(),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(),
      );
    }
  }
}
