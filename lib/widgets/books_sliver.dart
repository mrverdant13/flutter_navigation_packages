import 'package:flutter/material.dart';
import 'package:flutter_navigation_packages/models/book.entity.dart';
import 'package:flutter_navigation_packages/state/books.notifier.dart';
import 'package:flutter_navigation_packages/widgets/book_card.dart';
import 'package:provider/provider.dart';

class BooksSliver extends StatelessWidget {
  const BooksSliver({
    Key? key,
    this.onBookTap,
  }) : super(key: key);

  final void Function(
    BuildContext context,
    Book book,
  )? onBookTap;

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
          return SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => BookCard(
                  book: books[index],
                  onTap: onBookTap == null
                      ? null
                      : () => onBookTap?.call(context, books[index]),
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
