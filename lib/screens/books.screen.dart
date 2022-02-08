import 'package:flutter/material.dart';
import 'package:flutter_navigation_packages/models/on_book_selection.callback.dart';
import 'package:flutter_navigation_packages/state/books.notifier.dart';
import 'package:flutter_navigation_packages/widgets/books_header.dart';
import 'package:flutter_navigation_packages/widgets/books_sliver.dart';
import 'package:provider/provider.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({
    Key? key,
    required this.onBookSelection,
  }) : super(key: key);

  static const routeName = 'BooksRoute';

  final OnBookSelectionCallback onBookSelection;

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) => context.read<BooksNotifier>().loadBooks(),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            const BooksHeader(),
            BooksSliver(onBookTap: widget.onBookSelection),
          ],
        ),
      );
}
