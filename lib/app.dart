import 'package:flutter/material.dart';

class NavigationApp extends StatelessWidget {
  const NavigationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: 'Navigation App',
        home: Scaffold(
          body: SafeArea(
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: FittedBox(
                  child: Text(
                    'Navigation App',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
