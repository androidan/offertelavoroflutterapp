import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:offerte_lavoro_flutter_app/pages/content_page.dart';
import 'package:offerte_lavoro_flutter_app/router/app_router.dart';
import 'package:offerte_lavoro_flutter_app/router/app_router.gr.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Offerte lavoro flutter app',
      theme: _theme(context),
      routerDelegate: AutoRouterDelegate(_appRouter),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }

  ThemeData _theme(BuildContext context) {
    const primaryColorDark = Color.fromARGB(255, 6, 29, 92);
    const primaryColorLight = Color.fromARGB(255, 2, 125, 253);
    const accentColor = Color.fromARGB(255, 255, 222, 89);
    final onSecondaryColor = Colors.grey[100]!;

    return ThemeData(
      primaryColor: primaryColorLight,
      primaryColorDark: primaryColorDark,
      colorScheme: ColorScheme.light(
        primary: primaryColorLight,
        secondary: accentColor,
        surface: accentColor,
        onSecondary: onSecondaryColor,
      ),
      brightness: Brightness.light,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
