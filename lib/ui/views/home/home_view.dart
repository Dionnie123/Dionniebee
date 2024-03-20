import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/ui/common/colors.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:dionniebee/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:dionniebee/ui/views/dashboard/widgets/page_scaffold.dart';
import 'package:dionniebee/ui/widgets/product_menu_item/food_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';
import 'package:dionniebee/ui/widgets/product_item/product_item.dart';
import 'package:dionniebee/ui/widgets/featured_products_listview/suggested_product_listview.dart';
import 'package:dionniebee/ui/widgets/product_menu_listview/product_menu_listview.dart';
import 'package:badges/badges.dart' as badges;

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  bool get initialiseSpecialViewModelsOnce => true;

  @override
  bool get disposeViewModel => false;

  @override
  Future<void> onViewModelReady(HomeViewModel viewModel) async {
    await viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  bool get fireOnViewModelReadyOnce => true;

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final parentViewModel =
        getParentViewModel<DashboardViewModel>(context, listen: false);

    return PageScaffold(
        title: "Home ",
        actions: [
          Builder(builder: (context) {
            return IconButton(
              icon: badges.Badge(
                  position: badges.BadgePosition.custom(top: -15, end: -10),
                  showBadge: true,
                  badgeAnimation: const badges.BadgeAnimation.scale(),
                  badgeContent: Text(
                    parentViewModel.cartService.cartCount.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: const Icon(Icons.shopping_bag_rounded)),
              onPressed: () async {
                await viewModel.goToCartView();
              },
            );
          }),
          hSpaceMedium,
        ],
        body: RefreshIndicator(
          onRefresh: () async {
            await viewModel.init();
          },
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(color: kcPrimaryAccent),
                ),
                Positioned(
                    right: 20,
                    bottom: -20,
                    child: Image.asset(
                      "assets/products/chickenjoy.png",
                      width: 180,
                    )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Start a delivery or \npickup order",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 12.0),
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.orange)),
                        onPressed: () async {
                          await viewModel.showDiag();
                        },
                        child: const Text(
                          "Order Now",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
            if (viewModel.products.isNotEmpty)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Menu",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.chevron_right_rounded)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            if (viewModel.products.isNotEmpty)
              ProductMenuListView(
                size: const Size(double.infinity, 108.0),
                products: viewModel.products,
                itemBuilder: (context, i) {
                  return Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: SkeletonLoader(
                        loading: viewModel.isBusy,
                        child: FoodMenuItem(
                          onTap: () {
                            viewModel.productView(
                                viewModel.products[i].id.toString());
                          },
                          viewModel.products[i],
                          size: const Size(120, 108.0),
                          onAdd: () async {
                            await viewModel.addToCart(viewModel.products[i]);
                          },
                        ),
                      ));
                },
              ),
            if (viewModel.products.isNotEmpty)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Featured Products",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (viewModel.products.isNotEmpty)
              FeaturedProductsListview(
                size: const Size(double.infinity, 238.0),
                products: viewModel.products,
                itemBuilder: (context, i) {
                  return SkeletonLoader(
                    loading: viewModel.isBusy,
                    child: ProductItem(
                      viewModel.products[i],
                      onTap: () {},
                      size: const Size(double.infinity, 238.0),
                      onAdd: () async {
                        await viewModel.addToCart(viewModel.products[i]);
                      },
                      onFavorite: () {},
                    ),
                  );
                },
              ),
            if (viewModel.products.isNotEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                          onPressed: () {}, child: const Text("Show me more!"))
                    ],
                  ),
                ),
              ),
          ]),
        ));
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) =>
      locator<HomeViewModel>();
}
