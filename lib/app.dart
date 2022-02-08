import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_navigation_packages/routers/_interface.dart';
import 'package:flutter_navigation_packages/state/book_details.notifier.dart';
import 'package:flutter_navigation_packages/state/books.notifier.dart';
import 'package:provider/provider.dart';

Future<void> startApp({
  required AppNavigator navigator,
}) async =>
    runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        FlutterError.onError = (details) => log(
              details.exceptionAsString(),
              error: details.exception,
              stackTrace: details.stack,
            );
        runApp(
          Provider<AppNavigator>.value(
            value: navigator,
            child: const NavigationApp(),
          ),
        );
      },
      (error, stackTrace) => log(
        error.toString(),
        error: error,
        stackTrace: stackTrace,
      ),
    );

class NavigationApp extends StatelessWidget {
  const NavigationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = context.watch<AppNavigator>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BooksNotifier()),
        ChangeNotifierProvider(create: (_) => BookDetailsNotifier()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: navigator.name,
        routerDelegate: navigator.routerDelegate,
        routeInformationParser: navigator.routeInformationParser,
      ),
    );
  }
}
