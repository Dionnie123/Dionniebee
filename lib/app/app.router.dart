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
import '../ui/views/foo/foo_view.dart' as _i5;
import '../ui/views/home/home_view.dart' as _i4;
import '../ui/views/orders/orders_view.dart' as _i6;
import '../ui/views/product/product_view.dart' as _i9;
import '../ui/views/promo/promo_view.dart' as _i8;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/stores/stores_view.dart' as _i7;
import '../ui/views/welcome/welcome_view.dart' as _i10;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i11.StackedService.navigatorKey);

class StackedRouterWeb extends _i12.RootStackRouter {
  StackedRouterWeb({_i13.GlobalKey<_i13.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
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
        transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FooViewRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.FooView(),
        transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrdersViewRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.OrdersView(),
        transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    StoresViewRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.StoresView(),
        transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PromoViewRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.PromoView(),
        transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProductViewRoute.name: (routeData) {
      final args = routeData.argsAs<ProductViewArgs>();
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.ProductView(
          args.id,
          key: args.key,
        ),
      );
    },
    WelcomeViewRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.WelcomeView(),
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
          FooViewRoute.name,
          path: '/foo-view',
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
/// [_i5.FooView]
class FooViewRoute extends _i12.PageRouteInfo<void> {
  const FooViewRoute()
      : super(
          FooViewRoute.name,
          path: '/foo-view',
        );

  static const String name = 'FooView';
}

/// generated route for
/// [_i6.OrdersView]
class OrdersViewRoute extends _i12.PageRouteInfo<void> {
  const OrdersViewRoute()
      : super(
          OrdersViewRoute.name,
          path: '/orders-view',
        );

  static const String name = 'OrdersView';
}

/// generated route for
/// [_i7.StoresView]
class StoresViewRoute extends _i12.PageRouteInfo<void> {
  const StoresViewRoute()
      : super(
          StoresViewRoute.name,
          path: '/stores-view',
        );

  static const String name = 'StoresView';
}

/// generated route for
/// [_i8.PromoView]
class PromoViewRoute extends _i12.PageRouteInfo<void> {
  const PromoViewRoute()
      : super(
          PromoViewRoute.name,
          path: '/promo-view',
        );

  static const String name = 'PromoView';
}

/// generated route for
/// [_i9.ProductView]
class ProductViewRoute extends _i12.PageRouteInfo<ProductViewArgs> {
  ProductViewRoute({
    required String id,
    _i13.Key? key,
  }) : super(
          ProductViewRoute.name,
          path: '/product-view',
          args: ProductViewArgs(
            id: id,
            key: key,
          ),
        );

  static const String name = 'ProductView';
}

class ProductViewArgs {
  const ProductViewArgs({
    required this.id,
    this.key,
  });

  final String id;

  final _i13.Key? key;

  @override
  String toString() {
    return 'ProductViewArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i10.WelcomeView]
class WelcomeViewRoute extends _i12.PageRouteInfo<void> {
  const WelcomeViewRoute()
      : super(
          WelcomeViewRoute.name,
          path: '/welcome-view',
        );

  static const String name = 'WelcomeView';
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

  Future<dynamic> navigateToFooView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const FooViewRoute(),
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
    required String id,
    _i13.Key? key,
    void Function(_i12.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      ProductViewRoute(
        id: id,
        key: key,
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

  Future<dynamic> replaceWithFooView(
      {void Function(_i12.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const FooViewRoute(),
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
    required String id,
    _i13.Key? key,
    void Function(_i12.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      ProductViewRoute(
        id: id,
        key: key,
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
}
