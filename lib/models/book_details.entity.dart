import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class BookDetails extends Equatable {
  const BookDetails({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
  });

  final int id;
  final String title;
  final String author;
  final String imageUrl;
  final String description;

  @override
  List<Object> get props => [id, title, author, imageUrl, description];
}
