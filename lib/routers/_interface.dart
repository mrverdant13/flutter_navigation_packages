import 'package:flutter/widgets.dart';

abstract class AppNavigator {
  const AppNavigator();

  String get name;
  RouterDelegate<Object> get routerDelegate;
  RouteInformationParser<Object> get routeInformationParser;
  Future<void> navigate(BuildContext context, String destination);
}
