import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_navigation_packages/app.dart';

Future<void> main() async => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        FlutterError.onError = (details) => log(
              details.exceptionAsString(),
              error: details.exception,
              stackTrace: details.stack,
            );
        runApp(const NavigationApp());
      },
      (error, stackTrace) => log(
        error.toString(),
        error: error,
        stackTrace: stackTrace,
      ),
    );
