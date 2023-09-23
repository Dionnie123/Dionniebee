import 'package:dionniebee/services/authentication_service.firebase.dart';
import 'package:dionniebee/services/product_service.dart';
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
import 'package:dionniebee/ui/views/product/product_view.dart';
import 'package:dionniebee/ui/views/welcome/welcome_view.dart';
import 'package:dionniebee/services/order_service.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    CustomRoute(
      page: StartupView,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    MaterialRoute(
      page: AuthView,
    ),
    MaterialRoute(
      page: CartView,
    ),
    CustomRoute(
      page: HomeView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),

    CustomRoute(
      page: FooView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: OrdersView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: StoresView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: PromoView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    MaterialRoute(
      page: ProductView,
    ),
    MaterialRoute(
      page: WelcomeView,
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
      classType: ProductService,
    ),
    LazySingleton(classType: LocationService),
    LazySingleton(classType: CartService),
    LazySingleton(classType: OrderService),
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
