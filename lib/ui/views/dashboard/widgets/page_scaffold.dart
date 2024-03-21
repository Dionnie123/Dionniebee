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
    this.refreshIndicatorTask,
  });
  final String title;
  final List<Widget> actions;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final Function? refreshIndicatorTask;
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
      body: RefreshIndicator(
        notificationPredicate: (notification) =>
            refreshIndicatorTask != null ? true : false,
        onRefresh: () async {
          await refreshIndicatorTask!();
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: isBusy
              ? Shimmer.fromColors(
                  key: const ValueKey('first'),
                  enabled: true,
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: body ?? const SizedBox.shrink())
              : SizedBox(
                  key: const ValueKey('sec'),
                  child: body ?? const SizedBox.shrink()),
        ),
      ),
      floatingActionButton: floatingActionButton,
      bottomSheet: bottomSheet,
    );
  }
}
