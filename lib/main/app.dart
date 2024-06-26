import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../core/generated/l10n.dart';
import '../core/styles/fonts.dart';
import 'navigation/app_router.dart';
import 'navigation/route_paths.dart';


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      theme: ThemeData(
          useMaterial3: false,
          fontFamily: Fonts.nunito),
      // Responsiveness
      // theme: Helper.isDarkTheme() ? darkAppTheme : appTheme,
      // theme: appTheme,
      builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            maxWidth: 1400,
            minWidth: 360,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(360, name: MOBILE),
              const ResponsiveBreakpoint.resize(600, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
          ),
        );
      },
      // Route Settings
      initialRoute: RoutePaths.splashScreen,
      onGenerateRoute: AppRouter.generateRoute,
      // Localization settings
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (context) => S.of(context).appName,
      locale: const Locale('en'),
      debugShowCheckedModeBanner: false,
    );
  }
}
