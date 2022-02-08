import 'package:flutter/material.dart';
import 'package:flutter_navigation_packages/state/book_details.notifier.dart';
import 'package:flutter_navigation_packages/widgets/book_details_card.dart';
import 'package:provider/provider.dart';

class BookDetailsPanel extends StatefulWidget {
  const BookDetailsPanel({
    Key? key,
    required this.bookId,
  }) : super(key: key);

  final int bookId;

  @override
  State<BookDetailsPanel> createState() => _BookDetailsPanelState();
}

class _BookDetailsPanelState extends State<BookDetailsPanel> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      debugLabel: 'book-details-scroll-controller',
    );
  }

  @override
  Widget build(BuildContext context) => Consumer<BookDetailsNotifier>(
        builder: (context, bookDetailsNotifier, _) {
          final details = bookDetailsNotifier.details;
          if (bookDetailsNotifier.isLoading || details == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            controller: _scrollController,
            child: BookDetailsCard(details: details),
          );
        },
      );
}
