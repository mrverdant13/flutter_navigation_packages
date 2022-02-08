import 'package:flutter/material.dart';
import 'package:flutter_navigation_packages/state/books.notifier.dart';
import 'package:provider/provider.dart';

class ReloadBooksButton extends StatelessWidget {
  const ReloadBooksButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () => context.read<BooksNotifier>().loadBooks(),
        icon: const Icon(Icons.refresh),
        tooltip: 'Reload books',
      );
}
