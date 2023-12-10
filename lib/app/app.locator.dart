// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/router_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/auth_service.dart';
import '../services/authentication_service.firebase.dart';
import '../services/cart_service.dart';
import '../services/local_storage_service.dart';
import '../services/location_service.dart';
import '../services/order_service.dart';
import '../services/product_service.dart';
import '../ui/views/cart/cart_viewmodel.dart';
import '../ui/views/dashboard/dashboard_viewmodel.dart';
import '../ui/views/home/home_viewmodel.dart';
import '../ui/views/orders/orders_viewmodel.dart';
import '../ui/views/promo/promo_viewmodel.dart';
import '../ui/views/stores/stores_viewmodel.dart';
import 'app.router.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
  StackedRouterWeb? stackedRouter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  final sharedPreferencesService = SharedPreferencesService();
  await sharedPreferencesService.init();
  locator.registerSingleton(sharedPreferencesService);

  final firebaseAuthService = FirebaseAuthService();
  await firebaseAuthService.init();
  locator.registerSingleton<AuthService>(firebaseAuthService);

  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => RouterService());
  locator.registerLazySingleton(() => ProductService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => CartService());
  locator.registerLazySingleton(() => OrderService());
  locator.registerSingleton(DashboardViewModel());
  locator.registerSingleton(HomeViewModel());
  locator.registerSingleton(PromoViewModel());
  locator.registerSingleton(OrdersViewModel());
  locator.registerSingleton(StoresViewModel());
  locator.registerSingleton(CartViewModel());
  if (stackedRouter == null) {
    throw Exception(
        'Stacked is building to use the Router (Navigator 2.0) navigation but no stackedRouter is supplied. Pass the stackedRouter to the setupLocator function in main.dart');
  }

  locator<RouterService>().setRouter(stackedRouter);
}
