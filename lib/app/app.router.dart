// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i13;
import 'package:stacked/stacked.dart' as _i12;
import 'package:stacked_services/stacked_services.dart' as _i11;

import '../ui/views/auth/auth_view.dart' as _i2;
import '../ui/views/cart/cart_view.dart' as _i3;
import '../ui/views/dashboard/dashboard_view.dart' as _i10;
import '../ui/views/home/home_view.dart' as _i4;
import '../ui/views/orders/orders_view.dart' as _i5;
import '../ui/views/product/product_view.dart' as _i8;
import '../ui/views/promo/promo_view.dart' as _i7;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/stores/stores_view.dart' as _i6;
import '../ui/views/welcome/welcome_view.dart' as _i9;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i11.StackedService.navigatorKey);

class StackedRouterWeb extends _i12.RootStackRouter {
  StackedRouterWeb({_i13.GlobalKey<_i13.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
      );
    },
    AuthViewRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthView(),
      );
    },
    CartViewRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.CartView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrdersViewRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.OrdersView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    StoresViewRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.StoresView(),
      );
    },
    PromoViewRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.PromoView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProductViewRoute.name: (routeData) {
      final args = routeData.argsAs<ProductViewArgs>(
          orElse: () => const ProductViewArgs());
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.ProductView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    WelcomeViewRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.WelcomeView(),
      );
    },
    DashboardViewRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.DashboardView(),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i12.RouteConfig(
          AuthViewRoute.name,
          path: '/auth-view',
        ),
        _i12.RouteConfig(
          CartViewRoute.name,
          path: '/cart-view',
        ),
        _i12.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i12.RouteConfig(
          OrdersViewRoute.name,
          path: '/orders-view',
        ),
        _i12.RouteConfig(
          StoresViewRoute.name,
          path: '/stores-view',
        ),
        _i12.RouteConfig(
          PromoViewRoute.name,
          path: '/promo-view',
        ),
        _i12.RouteConfig(
          ProductViewRoute.name,
          path: '/product-view',
        ),
        _i12.RouteConfig(
          WelcomeViewRoute.name,
          path: '/welcome-view',
        ),
        _i12.RouteConfig(
          DashboardViewRoute.name,
          path: '/dashboard-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i12.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.AuthView]
class AuthViewRoute extends _i12.PageRouteInfo<void> {
  const AuthViewRoute()
      : super(
          AuthViewRoute.name,
          path: '/auth-view',
        );

  static const String name = 'AuthView';
}

/// generated route for
/// [_i3.CartView]
class CartViewRoute extends _i12.PageRouteInfo<void> {
  const CartViewRoute()
      : super(
          CartViewRoute.name,
          path: '/cart-view',
        );

  static const String name = 'CartView';
}

/// generated route for
/// [_i4.HomeView]
class HomeViewRoute extends _i12.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i5.OrdersView]
class OrdersViewRoute extends _i12.PageRouteInfo<void> {
  const OrdersViewRoute()
      : super(
          OrdersViewRoute.name,
          path: '/orders-view',
        );

  static const String name = 'OrdersView';
}

/// generated route for
/// [_i6.StoresView]
class StoresViewRoute extends _i12.PageRouteInfo<void> {
  const StoresViewRoute()
      : super(
          StoresViewRoute.name,
          path: '/stores-view',
        );

  static const String name = 'StoresView';
}

/// generated route for
/// [_i7.PromoView]
class PromoViewRoute extends _i12.PageRouteInfo<void> {
  const PromoViewRoute()
      : super(
          PromoViewRoute.name,
          path: '/promo-view',
        );

  static const String name = 'PromoView';
}

/// generated route for
/// [_i8.ProductView]
class ProductViewRoute extends _i12.PageRouteInfo<ProductViewArgs> {
  ProductViewRoute({
    _i13.Key? key,
    String? id,
  }) : super(
          ProductViewRoute.name,
          path: '/product-view',
          args: ProductViewArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'ProductView';
}

class ProductViewArgs {
  const ProductViewArgs({
    this.key,
    this.id,
  });

  final _i13.Key? key;

  final String? id;

  @override
  String toString() {
    return 'ProductViewArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i9.WelcomeView]
class WelcomeViewRoute extends _i12.PageRouteInfo<void> {
  const WelcomeViewRoute()
      : super(
          WelcomeViewRoute.name,
          path: '/welcome-view',
        );

  static const String name = 'WelcomeView';
}

/// generated route for
/// [_i10.DashboardView]
class DashboardViewRoute extends _i12.PageRouteInfo<void> {
  const DashboardViewRoute()
      : super(
          DashboardViewRoute.name,
          path: '/dashboard-view',
        );

  static const String name = 'DashboardView';
}

extension RouterStateExtension on _i11.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAuthView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AuthViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCartView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const CartViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToOrdersView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const OrdersViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToStoresView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StoresViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToPromoView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const PromoViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToProductView({
    _i13.Key? key,
    String? id,
    void Function(_i12.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      ProductViewRoute(
        key: key,
        id: id,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToWelcomeView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const WelcomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToDashboardView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const DashboardViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAuthView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AuthViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCartView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const CartViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithOrdersView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const OrdersViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStoresView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StoresViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithPromoView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const PromoViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithProductView({
    _i13.Key? key,
    String? id,
    void Function(_i12.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      ProductViewRoute(
        key: key,
        id: id,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithWelcomeView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const WelcomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithDashboardView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const DashboardViewRoute(),
      onFailure: onFailure,
    );
  }
}
