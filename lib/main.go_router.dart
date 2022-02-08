import 'dart:async';
import 'package:flutter_navigation_packages/app.dart';
import 'package:flutter_navigation_packages/routers/go_router.dart';

Future<void> main() => startApp(
      navigator: GoRouterNavigator(),
    );
