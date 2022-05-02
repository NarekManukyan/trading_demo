import 'package:easy_localization/easy_localization.dart';
import 'package:flavorbanner/flavorbanner.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:get_it/get_it.dart';

import 'providers/flavor_service.dart';
import 'providers/screen_service.dart';
import 'themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextHeightBehavior(
      textHeightBehavior: const TextHeightBehavior(
        leadingDistribution: TextLeadingDistribution.even,
      ),
      child: MaterialApp.router(
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: GetIt.I<FlavorService>().isDevelopment,
        theme: lightTheme,
        routerDelegate: router.delegate(
          navigatorObservers: () => [
            // analyticsService.observer,
          ],
        ),
        builder: (context, child) => FlavorBanner(
          child: child ?? const Scaffold(),
        ),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}
