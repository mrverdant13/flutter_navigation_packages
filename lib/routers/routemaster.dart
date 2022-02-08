import 'package:flutter/material.dart';
import 'package:flutter_navigation_packages/routers/_interface.dart';
import 'package:flutter_navigation_packages/screens/book_details.screen.dart';
import 'package:flutter_navigation_packages/screens/books.screen.dart';
import 'package:routemaster/routemaster.dart';

class RoutemasterNavigator extends AppNavigator {
  late final _routeMap = RouteMap(
    routes: {
      '/books': (_) => const MaterialPage<void>(
            child: BooksScreen(),
          ),
      '/books/:bookId': (routeData) => MaterialPage<void>(
            child: BookDetailsScreen(
              bookId: int.parse(routeData.pathParameters['bookId']!),
            ),
          ),
    },
  );

  @override
  String get name => 'routemaster';

  @override
  Future<void> navigate(BuildContext context, String destination) async =>
      Routemaster.of(context).push(destination);

  @override
  RouterDelegate<Object> get routerDelegate => RoutemasterDelegate(
        routesBuilder: (_) => _routeMap,
      );

  @override
  RouteInformationParser<Object> get routeInformationParser =>
      const RoutemasterParser();
}
