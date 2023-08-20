import 'package:dionniebee/services/authentication_service.firebase.dart';
import 'package:dionniebee/services/product_service.firebase.dart';
import 'package:dionniebee/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:dionniebee/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/ui/views/auth/auth_view.dart';
import 'package:dionniebee/ui/views/cart/cart_view.dart';
import 'package:dionniebee/ui/views/home/home_view.dart';
import 'package:dionniebee/ui/views/startup/startup_view.dart';
import 'package:dionniebee/ui/views/foo/foo_view.dart';
import 'package:dionniebee/ui/views/orders/orders_view.dart';
import 'package:dionniebee/ui/views/stores/stores_view.dart';
import 'package:dionniebee/services/location_service.dart';
import 'package:dionniebee/services/cart_service.dart';
import 'package:dionniebee/ui/views/promo/promo_view.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(
      page: AuthView,
      path: '/',
      initial: true,
    ),
    MaterialRoute(
      page: CartView,
      path: '/',
    ),
    CustomRoute(
      page: HomeView,
      path: '/',
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      path: '/',
      page: StartupView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      path: '/',
      page: FooView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      path: '/',
      page: OrdersView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      path: '/',
      page: StoresView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      path: '/',
      page: PromoView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
// @stacked-route
  ],
  dependencies: [
    InitializableSingleton(
      classType: FirebaseAuthService,
      asType: AuthService,
    ),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),

    LazySingleton(
      classType: FirebaseProductService,
    ),
    LazySingleton(classType: LocationService),
    LazySingleton(classType: CartService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
