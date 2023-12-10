import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:dionniebee/ui/views/dashboard/widgets/page_scaffold.dart';
import 'package:dionniebee/ui/views/stores/widgets/delivery_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'stores_viewmodel.dart';
import 'widgets/pickup_view.dart';

class StoresView extends StatefulWidget {
  const StoresView({super.key});

  @override
  State<StoresView> createState() => _StoresViewState();
}

class _StoresViewState extends State<StoresView> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoresViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => locator<StoresViewModel>(),
        initialiseSpecialViewModelsOnce: true,
        fireOnViewModelReadyOnce: true,
        onViewModelReady: (viewModel) async {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            //  await viewModel.start();
          });
        },
        builder: (
          BuildContext context,
          StoresViewModel viewModel,
          Widget? child,
        ) {
          return PageScaffold(
            title: 'STORES',
            body: Column(
              children: [
                ColoredBox(
                  color: Colors.grey.shade300,
                  child: TabBar(
                    controller: tabController,
                    indicator: BoxDecoration(
                      color: Colors.yellow.shade900,
                    ),
                    overlayColor: const MaterialStatePropertyAll(Colors.red),
                    tabs: const [
                      Tab(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delivery_dining,
                              color: Colors.black,
                            ),
                            hSpaceSmall,
                            Text(
                              "Delivery",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delivery_dining,
                              color: Colors.black,
                            ),
                            hSpaceSmall,
                            Text(
                              "Pick Up",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      DeliveryView(),
                      PickupView(),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
