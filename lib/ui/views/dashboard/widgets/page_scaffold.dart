import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PageScaffold extends StatelessWidget {
  const PageScaffold({
    super.key,
    required this.title,
    this.actions = const [],
    this.body,
    this.floatingActionButton,
    this.bottomSheet,
    this.isBusy = false,
  });
  final String title;
  final List<Widget> actions;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    // 1. look for an ancestor Scaffold
    final ancestorScaffold = Scaffold.maybeOf(context);
    // 2. check if it has a drawer
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // 3. add a non-null leading argument if we have a drawer
        automaticallyImplyLeading: hasDrawer,
        leading: hasDrawer
            ? IconButton(
                icon: const Icon(Icons.menu),
                // 4. open the drawer if we have one
                onPressed:
                    hasDrawer ? () => ancestorScaffold.openDrawer() : null,
              )
            : null,
        title: Text(title),
        actions: actions,
      ),
      body: isBusy
          ? Shimmer.fromColors(
              enabled: true,
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: body ?? const SizedBox.shrink())
          : body,
      floatingActionButton: floatingActionButton,
      bottomSheet: bottomSheet,
    );
  }
}
