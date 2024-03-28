import 'package:dionniebee/global/breakpoints.dart';
import 'package:dionniebee/global/themes.dart';
import 'package:dionniebee/app/helpers/lifecycle_manager/lifecycle_manager.dart';
import 'package:dionniebee/global/typography.dart';
import 'package:dionniebee/services/loader_overlay/loader_manager.dart';
import 'package:dionniebee/services/fluttertoast/fluttertoast_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dionniebee/app/app.bottomsheets.dart';
import 'package:dionniebee/app/app.dialogs.dart';
import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'url_strategy_native.dart'
    if (dart.library.html) 'url_strategy_web.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setScreenBreakPoints();

  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();
  setGoogleFontLicense();
  runApp(const MainApp());
  urlConfig();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
      child: MaterialApp.router(
        builder: (context, child) =>
            LoaderOverlayManager(child: FlutterToastManager(child: child)),
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerDelegate: stackedRouter.delegate(),
        routeInformationParser: stackedRouter.defaultRouteParser(),
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
