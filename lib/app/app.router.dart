// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i11;
import 'package:stacked/stacked.dart' as _i10;
import 'package:stacked_services/stacked_services.dart' as _i9;

import '../ui/views/auth/auth_view.dart' as _i1;
import '../ui/views/cart/cart_view.dart' as _i2;
import '../ui/views/foo/foo_view.dart' as _i5;
import '../ui/views/home/home_view.dart' as _i3;
import '../ui/views/orders/orders_view.dart' as _i6;
import '../ui/views/promo/promo_view.dart' as _i8;
import '../ui/views/startup/startup_view.dart' as _i4;
import '../ui/views/stores/stores_view.dart' as _i7;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i9.StackedService.navigatorKey);

class StackedRouterWeb extends _i10.RootStackRouter {
  StackedRouterWeb({_i11.GlobalKey<_i11.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AuthViewRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AuthView(),
      );
    },
    CartViewRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CartView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
        transitionsBuilder: _i10.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    StartupViewRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.StartupView(),
        transitionsBuilder: _i10.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FooViewRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.FooView(),
        transitionsBuilder: _i10.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrdersViewRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.OrdersView(),
        transitionsBuilder: _i10.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    StoresViewRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.StoresView(),
        transitionsBuilder: _i10.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PromoViewRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.PromoView(),
        transitionsBuilder: _i10.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          AuthViewRoute.name,
          path: '/',
        ),
        _i10.RouteConfig(
          CartViewRoute.name,
          path: '/',
        ),
        _i10.RouteConfig(
          HomeViewRoute.name,
          path: '/',
        ),
        _i10.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i10.RouteConfig(
          FooViewRoute.name,
          path: '/',
        ),
        _i10.RouteConfig(
          OrdersViewRoute.name,
          path: '/',
        ),
        _i10.RouteConfig(
          StoresViewRoute.name,
          path: '/',
        ),
        _i10.RouteConfig(
          PromoViewRoute.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.AuthView]
class AuthViewRoute extends _i10.PageRouteInfo<void> {
  const AuthViewRoute()
      : super(
          AuthViewRoute.name,
          path: '/',
        );

  static const String name = 'AuthView';
}

/// generated route for
/// [_i2.CartView]
class CartViewRoute extends _i10.PageRouteInfo<void> {
  const CartViewRoute()
      : super(
          CartViewRoute.name,
          path: '/',
        );

  static const String name = 'CartView';
}

/// generated route for
/// [_i3.HomeView]
class HomeViewRoute extends _i10.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i4.StartupView]
class StartupViewRoute extends _i10.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i5.FooView]
class FooViewRoute extends _i10.PageRouteInfo<void> {
  const FooViewRoute()
      : super(
          FooViewRoute.name,
          path: '/',
        );

  static const String name = 'FooView';
}

/// generated route for
/// [_i6.OrdersView]
class OrdersViewRoute extends _i10.PageRouteInfo<void> {
  const OrdersViewRoute()
      : super(
          OrdersViewRoute.name,
          path: '/',
        );

  static const String name = 'OrdersView';
}

/// generated route for
/// [_i7.StoresView]
class StoresViewRoute extends _i10.PageRouteInfo<void> {
  const StoresViewRoute()
      : super(
          StoresViewRoute.name,
          path: '/',
        );

  static const String name = 'StoresView';
}

/// generated route for
/// [_i8.PromoView]
class PromoViewRoute extends _i10.PageRouteInfo<void> {
  const PromoViewRoute()
      : super(
          PromoViewRoute.name,
          path: '/',
        );

  static const String name = 'PromoView';
}

extension RouterStateExtension on _i9.RouterService {
  Future<dynamic> navigateToAuthView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AuthViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCartView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const CartViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToStartupView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToFooView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const FooViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToOrdersView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const OrdersViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToStoresView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StoresViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToPromoView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const PromoViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAuthView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AuthViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCartView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const CartViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithFooView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const FooViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithOrdersView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const OrdersViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStoresView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StoresViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithPromoView(
      {void Function(_i10.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const PromoViewRoute(),
      onFailure: onFailure,
    );
  }
}
