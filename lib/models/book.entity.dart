import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Book extends Equatable {
  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
  });

  factory Book.fakeFromId(int id) => Book(
        id: id,
        title: 'Title Of The Book #$id',
        author: 'Author $id',
        // Offset on image ID to avoid similar pictures.
        imageUrl: 'https://picsum.photos/id/${id + 10}/300/400',
      );

  final int id;
  final String title;
  final String author;
  final String imageUrl;

  @override
  List<Object> get props => [id, title, author, imageUrl];
}
