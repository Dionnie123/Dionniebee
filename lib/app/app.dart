import 'package:dionniebee/services/firebase_auth_service.dart';
import 'package:dionniebee/services/local_storage_service.dart';
import 'package:dionniebee/services/sharedpreferences_local_storage_service.dart';
import 'package:dionniebee/services/product_service.dart';
import 'package:dionniebee/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:dionniebee/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:dionniebee/ui/views/cart/cart_viewmodel.dart';
import 'package:dionniebee/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:dionniebee/ui/views/home/home_viewmodel.dart';
import 'package:dionniebee/ui/views/orders/orders_viewmodel.dart';
import 'package:dionniebee/ui/views/promo/promo_viewmodel.dart';
import 'package:dionniebee/ui/views/stores/stores_viewmodel.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/ui/views/auth/auth_view.dart';
import 'package:dionniebee/ui/views/startup/startup_view.dart';
import 'package:dionniebee/services/location_service.dart';
import 'package:dionniebee/services/cart_service.dart';
import 'package:dionniebee/ui/views/welcome/welcome_view.dart';
import 'package:dionniebee/services/order_service.dart';
import 'package:dionniebee/ui/views/dashboard/dashboard_view.dart';
import 'package:dionniebee/ui/views/validation_example/validation_example_view.dart';
import 'package:dionniebee/services/foo_service.dart';
import 'package:dionniebee/services/supabase_auth_service.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(path: '/', page: StartupView, initial: true),
    MaterialRoute(path: '/', page: AuthView),
    MaterialRoute(path: '/', page: WelcomeView),
    MaterialRoute(path: '/', page: DashboardView),
    MaterialRoute(page: ValidationExampleView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(
      classType: RouterService,
    ),

    InitializableSingleton(
      classType: SharedPreferencesLocalStorageService,
      asType: LocalStorageService,
    ),

    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),

    InitializableSingleton(
      classType: FirebaseAuthService,
      asType: AuthService,
    ),

    LazySingleton(classType: ProductService),
    LazySingleton(classType: LocationService),
    LazySingleton(classType: CartService),
    LazySingleton(classType: OrderService),

    Singleton(classType: DashboardViewModel),
    Singleton(classType: HomeViewModel),
    Singleton(classType: PromoViewModel),
    Singleton(classType: OrdersViewModel),
    Singleton(classType: StoresViewModel),
    Singleton(classType: CartViewModel),

    LazySingleton(classType: FooService),
    LazySingleton(classType: FirebaseAuthService),
    LazySingleton(classType: SupabaseAuthService),
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
