import 'package:dionniebee/app/helpers/lifecycle_manager/lifecycle_manager.dart';
import 'package:dionniebee/ui/common/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dionniebee/app/app.bottomsheets.dart';
import 'package:dionniebee/app/app.dialogs.dart';
import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'url_strategy_native.dart'
    if (dart.library.html) 'url_strategy_web.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 1366, tablet: 768, watch: 200),
  );
  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MainApp());
  urlConfig();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
      child: MaterialApp.router(
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
            fontFamily: GoogleFonts.varelaRound().fontFamily,
            useMaterial3: false,
            appBarTheme: AppBarTheme(
                backgroundColor: kcPrimaryColor,
                foregroundColor: Colors.white,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.varelaRound().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            brightness: Brightness.light,
            textTheme:
                GoogleFonts.varelaRoundTextTheme(Theme.of(context).textTheme),
            colorSchemeSeed: kcPrimaryColor),
        darkTheme: ThemeData(
          fontFamily: GoogleFonts.varelaRound().fontFamily,
          useMaterial3: true,
          brightness: Brightness.dark,
        ).copyWith(
            // colorScheme: darkColorScheme,
            ),
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
