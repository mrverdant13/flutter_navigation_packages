import 'package:flutter/material.dart';
import 'package:flutter_navigation_packages/widgets/reload_books_button.dart';

class BooksHeader extends StatelessWidget {
  const BooksHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SliverAppBar(
        title: Text('Books'),
        leading: Icon(Icons.book),
        actions: [ReloadBooksButton()],
        floating: true,
        snap: true,
      );
}
