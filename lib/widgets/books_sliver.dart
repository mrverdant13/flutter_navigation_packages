import 'package:flutter/material.dart';
import 'package:flutter_navigation_packages/routers/interface.dart';
import 'package:flutter_navigation_packages/state/books.notifier.dart';
import 'package:flutter_navigation_packages/widgets/book_card.dart';
import 'package:provider/provider.dart';

class BooksSliver extends StatelessWidget {
  const BooksSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<BooksNotifier>(
        builder: (context, notifier, _) {
          if (notifier.isLoading) {
            return const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }

          final books = notifier.books;

          if (books.isEmpty) {
            return const SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverFillRemaining(
                child: Center(
                  child: Text(
                    'No books found',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }

          return SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => BookCard(
                  book: books[index],
                  onTap: () async => context
                      .read<AppNavigator>()
                      .navigate(context, '/books/${books[index].id}'),
                ),
                childCount: books.length,
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                mainAxisExtent: 80,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
            ),
          );
        },
      );
}
