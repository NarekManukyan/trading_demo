import 'package:auto_route/auto_route.dart';

import 'pages/bot_page/bot_page.dart';
import 'pages/dashboard/dashboard_page.dart';

export 'router.gr.dart';

@AdaptiveAutoRouter(
  preferRelativeImports: true,
  replaceInRouteName: 'Page,Route',
  routes: [
    // AdaptiveRoute(
    //   page: SplashScreenPage,
    //   initial: true,
    //   fullscreenDialog: true,
    // ),
    AdaptiveRoute(
      page: DashboardPage,
      initial: true,
      fullscreenDialog: true,
    ),
    AdaptiveRoute(
      page: BotPage,
      fullscreenDialog: true,
    ),
  ],
)
class $Router {}
