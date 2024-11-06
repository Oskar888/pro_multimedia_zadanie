import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'custom_route.dart';

class AppRouter {
  AppRouter._internal();
  static final AppRouter _instance = AppRouter._internal();
  static AppRouter get instance => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final FluroRouter router = FluroRouter();

  Future<void> init({
    required List<CustomRoute> routes,
  }) async {
    for (final CustomRoute route in routes) {
      router.define(
        route.route,
        handler: route.handler,
        transitionType: route.transitionType,
      );
    }
  }

  bool routeExists(String? routeName) {
    if (routeName == null) {
      return false;
    }

    final AppRouteMatch? appRouteMatch = router.match(routeName);
    return appRouteMatch != null;
  }

  void pop<T extends Object?>([T? result]) {
    navigatorKey.currentState?.pop(result);
  }

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) async {
    // ignore: avoid_print
    print('Routing to $routeName');

    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> replace<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) async {
    // ignore: avoid_print
    print('Routing to $routeName');

    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<void> removeAllAndPush(String routeName) async {
    // ignore: avoid_print
    print('Routing to $routeName');

    await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (_) => false,
    );
  }
}
