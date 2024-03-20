// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i8;
import 'package:stacked/stacked.dart' as _i7;
import 'package:stacked_services/stacked_services.dart' as _i6;

import '../ui/views/auth/auth_view.dart' as _i2;
import '../ui/views/dashboard/dashboard_view.dart' as _i4;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/validation_example/validation_example_view.dart' as _i5;
import '../ui/views/welcome/welcome_view.dart' as _i3;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i6.StackedService.navigatorKey);

class StackedRouterWeb extends _i7.RootStackRouter {
  StackedRouterWeb({_i8.GlobalKey<_i8.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
      );
    },
    AuthViewRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthView(),
      );
    },
    WelcomeViewRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.WelcomeView(),
      );
    },
    DashboardViewRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.DashboardView(),
        transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ValidationExampleViewRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ValidationExampleView(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          AuthViewRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          WelcomeViewRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          DashboardViewRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          ValidationExampleViewRoute.name,
          path: '/validation-example-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i7.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.AuthView]
class AuthViewRoute extends _i7.PageRouteInfo<void> {
  const AuthViewRoute()
      : super(
          AuthViewRoute.name,
          path: '/',
        );

  static const String name = 'AuthView';
}

/// generated route for
/// [_i3.WelcomeView]
class WelcomeViewRoute extends _i7.PageRouteInfo<void> {
  const WelcomeViewRoute()
      : super(
          WelcomeViewRoute.name,
          path: '/',
        );

  static const String name = 'WelcomeView';
}

/// generated route for
/// [_i4.DashboardView]
class DashboardViewRoute extends _i7.PageRouteInfo<void> {
  const DashboardViewRoute()
      : super(
          DashboardViewRoute.name,
          path: '/',
        );

  static const String name = 'DashboardView';
}

/// generated route for
/// [_i5.ValidationExampleView]
class ValidationExampleViewRoute extends _i7.PageRouteInfo<void> {
  const ValidationExampleViewRoute()
      : super(
          ValidationExampleViewRoute.name,
          path: '/validation-example-view',
        );

  static const String name = 'ValidationExampleView';
}

extension RouterStateExtension on _i6.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAuthView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AuthViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToWelcomeView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const WelcomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToDashboardView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const DashboardViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToValidationExampleView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ValidationExampleViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAuthView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AuthViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithWelcomeView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const WelcomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithDashboardView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const DashboardViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithValidationExampleView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ValidationExampleViewRoute(),
      onFailure: onFailure,
    );
  }
}
