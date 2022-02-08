import 'package:flutter/material.dart';
import 'package:flutter_navigation_packages/models/on_book_selection.callback.dart';
import 'package:flutter_navigation_packages/state/book_details.notifier.dart';
import 'package:flutter_navigation_packages/widgets/book_details_panel.dart';
import 'package:flutter_navigation_packages/widgets/books_sliver.dart';
import 'package:provider/provider.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({
    Key? key,
    required this.bookId,
    required this.onBookSelection,
  }) : super(key: key);

  static const routeName = 'BookDetailsRoute';

  final int bookId;
  final OnBookSelectionCallback onBookSelection;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  late final ScrollController _booksScrollController;

  @override
  void initState() {
    super.initState();
    _booksScrollController = ScrollController(
      debugLabel: 'books-scroll-controller',
    );
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) => context
          .read<BookDetailsNotifier>()
          .loadDetails(bookId: widget.bookId),
    );
  }

  @override
  void dispose() {
    _booksScrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BookDetailsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.bookId != widget.bookId) {
      WidgetsBinding.instance?.addPostFrameCallback(
        (_) => context
            .read<BookDetailsNotifier>()
            .loadDetails(bookId: widget.bookId),
      );
    }
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final showSplitView = width > 800;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Book Details'),
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (showSplitView)
                  Expanded(
                    child: CustomScrollView(
                      key: const PageStorageKey('books-grid'),
                      restorationId: 'books-grid',
                      controller: _booksScrollController,
                      slivers: [
                        BooksSliver(
                          onBookTap: widget.onBookSelection,
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  flex: 2,
                  child: BookDetailsPanel(
                    key: PageStorageKey(widget.bookId),
                    bookId: widget.bookId,
                  ),
                ),
              ],
            ),
          );
        },
      );
}
