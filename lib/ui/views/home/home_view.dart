import 'package:dionniebee/ui/widgets/common/dashboard/widgets/app_bar_widget.dart';
import 'package:dionniebee/ui/widgets/common/dashboard/widgets/bottom_nav_widget.dart';
import 'package:dionniebee/ui/widgets/common/dashboard/widgets/drawer_widget.dart';
import 'package:dionniebee/ui/widgets/common/product_menu_item/food_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';
import 'package:dionniebee/ui/widgets/common/product_item/product_item.dart';
import 'package:dionniebee/ui/widgets/common/featured_products_listview/suggested_product_listview.dart';
import 'package:dionniebee/ui/widgets/common/product_menu_listview/product_menu_listview.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      drawer: const DrawerWidget(),
      bottomNavigationBar: const NavigationBarWidget(selectedIndex: 0),
      appBar: AppBarWidget(
        onCartTap: () {
          viewModel.goToCartView();
        },
        onSignOut: () async {
          await viewModel.signOut();
        },
        cartCount: viewModel.cartCount,
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Stack(children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            ),
            Positioned(
                right: 5,
                bottom: -20,
                child: Image.asset(
                  "assets/jollibot/chickenjoy.png",
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
                    onPressed: () {},
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
                child: FoodMenuItem(
                  onTap: () {
                    viewModel.productView(viewModel.products[i].id.toString());
                  },
                  viewModel.products[i],
                  size: const Size(120, 108.0),
                  onAdd: () async {
                    await viewModel.addToCart(viewModel.products[i]);
                  },
                ),
              );
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
              return ProductItem(
                onTap: () {},
                viewModel.products[i],
                size: const Size(double.infinity, 238.0),
                onAdd: () async {
                  await viewModel.addToCart(viewModel.products[i]);
                },
              );
            },
          ),
        if (viewModel.products.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {}, child: const Text("Show me more!"))
                ],
              ),
            ),
          )
      ]),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  bool get fireOnViewModelReadyOnce => false;
}
