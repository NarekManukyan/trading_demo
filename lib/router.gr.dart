// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import 'models/bot_model/bot_model.dart' as _i5;
import 'pages/bot_page/bot_page.dart' as _i2;
import 'pages/dashboard/dashboard_page.dart' as _i1;

class Router extends _i3.RootStackRouter {
  Router([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.DashboardPage(),
          fullscreenDialog: true);
    },
    BotRoute.name: (routeData) {
      final args = routeData.argsAs<BotRouteArgs>();
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.BotPage(key: args.key, bot: args.bot),
          fullscreenDialog: true);
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(DashboardRoute.name, path: '/'),
        _i3.RouteConfig(BotRoute.name, path: '/bot-page')
      ];
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i3.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: '/');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i2.BotPage]
class BotRoute extends _i3.PageRouteInfo<BotRouteArgs> {
  BotRoute({_i4.Key? key, required _i5.BotModel bot})
      : super(BotRoute.name,
            path: '/bot-page', args: BotRouteArgs(key: key, bot: bot));

  static const String name = 'BotRoute';
}

class BotRouteArgs {
  const BotRouteArgs({this.key, required this.bot});

  final _i4.Key? key;

  final _i5.BotModel bot;

  @override
  String toString() {
    return 'BotRouteArgs{key: $key, bot: $bot}';
  }
}
