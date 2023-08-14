import 'package:dionniebee/app/helpers/offline_checker.dart';
import 'package:dionniebee/ui/widgets/common/dashboard/widgets/drawer_widget.dart';
import 'package:dionniebee/ui/widgets/common/product_menu_item/food_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:badges/badges.dart' as badges;
import 'home_viewmodel.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:dionniebee/ui/widgets/common/cart_item/cart_item.dart';
import 'package:dionniebee/ui/widgets/common/cart_listview/cart_breakdown.dart';
import 'package:dionniebee/ui/widgets/common/product_item/product_item.dart';
import 'package:dionniebee/ui/widgets/common/side_cart/side_cart.dart';
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
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) async {
          if (index == 3) {
            if (await hasNetwork() == true) {
              viewModel.navService.navigateToStoresView();
            }
          }
        },
        selectedIndex: 0,
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
      ),
      appBar: AppBar(
        elevation: 0,

        //automaticallyImplyLeading: false,
        title: const Text(
          "DionnieBee",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: () async {
              await viewModel.signOut();
            },
          ),
          Builder(builder: (context) {
            return IconButton(
              icon: badges.Badge(
                  position: badges.BadgePosition.custom(top: -15, end: -10),
                  showBadge: viewModel.cartItemsQuantity > 0,
                  badgeAnimation: const badges.BadgeAnimation.scale(),
                  badgeContent: Text(
                    viewModel.cartItemsQuantity.toString(),
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
      ),
      endDrawer: SideCart(
        itemCount: viewModel.cart.length,
        actionButtons: const [],
        cartBreakdown: CartBreakdown(subTotal: viewModel.cartTotal),
        itemBuilder: (context, index) {
          return CartItem(
            viewModel.cart[index],
            onAdd: () {
              viewModel.addCartItemQuantity(viewModel.cart[index].id ?? -1);
            },
            onMinus: () {
              viewModel.minusCartItemQuantity(viewModel.cart[index].id ?? -1);
            },
            size: const Size(double.infinity, 150),
          );
        },
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          await viewModel.start(false);
        },
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Stack(children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
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
                      viewModel.navService.navigateToFooView();
                    },
                    viewModel.products[i],
                    size: const Size(120, 108.0),
                    onAdd: () {
                      viewModel.addToCart(viewModel.products[i]);
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
          SuggestedProductListview(
            size: const Size(double.infinity, 238.0),
            products: viewModel.products,
            itemBuilder: (context, i) {
              return ProductItem(
                onTap: () {},
                viewModel.products[i],
                size: const Size(double.infinity, 238.0),
                onAdd: () {
                  viewModel.addToCart(viewModel.products[i]);
                },
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
            )
        ]),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  Future<void> onViewModelReady(HomeViewModel viewModel) async {
    await viewModel.start(true);
    super.onViewModelReady(viewModel);
  }

  @override
  bool get fireOnViewModelReadyOnce => false;
}
