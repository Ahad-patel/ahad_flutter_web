import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigationService._internal();

  factory NavigationService() => _instance;

  navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  bool canPop() {
    return navigatorKey.currentState!.canPop();
  }

  pop<T>([T? value]) {
    return navigatorKey.currentContext!.pop(value);
  }

  popUntil(String desiredRoute) {
    return navigatorKey.currentState!.popUntil((route) {
      return route.settings.name == desiredRoute;
    });
  }

  Future<dynamic> pushNamed(route, {dynamic args}) {
    return navigatorKey.currentContext!.pushNamed(route, extra: args);
  }

  void pushNamedAndRemoveUntil(
      String route, bool Function(Route<dynamic> route) popToInitial,
      {dynamic args}) {
    return navigatorKey.currentContext!.goNamed(route, extra: args);
  }

  Future<dynamic> pushReplacementNamed(String desiredRoute, {dynamic args}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(desiredRoute, arguments: args);
  }

  BuildContext getNavigationContext() {
    return navigatorKey.currentState!.context;
  }
}
