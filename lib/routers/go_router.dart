import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_navigation_packages/routers/interface.dart';
import 'package:flutter_navigation_packages/screens/book_details.screen.dart';
import 'package:flutter_navigation_packages/screens/books.screen.dart';
import 'package:go_router/go_router.dart';

class GoRouterNavigator extends AppNavigator {
  late final _router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: '/books',
    routes: [
      GoRoute(
        path: '/books',
        builder: (context, state) => const BooksScreen(),
        routes: [
          GoRoute(
            path: r':bookId(\d+)',
            builder: (context, state) => BookDetailsScreen(
              bookId: int.parse(state.params['bookId']!),
            ),
          ),
        ],
      ),
    ],
  );

  @override
  String get name => 'go_router';

  @override
  Future<void> navigate(
    BuildContext context,
    String destination,
  ) async =>
      context.go(destination);

  @override
  RouterDelegate<Object> get routerDelegate => _router.routerDelegate;

  @override
  RouteInformationParser<Object> get routeInformationParser =>
      _router.routeInformationParser;
}
