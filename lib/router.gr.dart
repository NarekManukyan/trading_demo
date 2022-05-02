// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import 'pages/dashboard/dashboard_page.dart' as _i1;

class Router extends _i2.RootStackRouter {
  Router([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.DashboardPage(),
          fullscreenDialog: true);
    }
  };

  @override
  List<_i2.RouteConfig> get routes =>
      [_i2.RouteConfig(DashboardRoute.name, path: '/')];
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i2.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: '/');

  static const String name = 'DashboardRoute';
}
