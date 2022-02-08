import 'package:flutter/material.dart';
import 'package:flutter_navigation_packages/models/book.entity.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    required this.book,
    this.onTap,
  }) : super(key: key);

  final Book book;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            children: [
              Image.network(book.imageUrl),
              Expanded(
                child: ListTile(
                  title: Text(book.title),
                  subtitle: Text('By ${book.author}'),
                ),
              ),
            ],
          ),
        ),
      );
}
