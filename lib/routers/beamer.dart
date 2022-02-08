import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_navigation_packages/routers/_interface.dart';
import 'package:flutter_navigation_packages/screens/book_details.screen.dart';
import 'package:flutter_navigation_packages/screens/books.screen.dart';

class BeamerNavigator extends AppNavigator {
  @override
  String get name => 'beamer';

  @override
  Future<void> navigate(BuildContext context, String destination) async =>
      context.beamToNamed(destination);

  @override
  RouterDelegate<Object> get routerDelegate => BeamerDelegate(
        initialPath: '/books',
        locationBuilder: RoutesLocationBuilder(
          routes: {
            '/books': (_, __, ___) => const BooksScreen(),
            '/books/:bookId': (_, state, ___) => BookDetailsScreen(
                  bookId: int.parse(state.pathParameters['bookId']!),
                ),
          },
        ),
      );

  @override
  RouteInformationParser<Object> get routeInformationParser => BeamerParser();
}
