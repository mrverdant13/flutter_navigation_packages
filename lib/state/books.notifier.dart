import 'dart:collection';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_navigation_packages/models/book.entity.dart';

@immutable
class BooksState extends Equatable {
  const BooksState({
    required this.isLoading,
    required List<Book> books,
  }) : _books = books;

  final bool isLoading;
  final List<Book> _books;
  UnmodifiableListView<Book> get books => UnmodifiableListView(_books);

  BooksState copyWith({
    bool? isLoading,
    List<Book>? books,
  }) =>
      BooksState(
        isLoading: isLoading ?? this.isLoading,
        books: books ?? _books,
      );

  @override
  List<Object> get props => [isLoading, _books];
}

class BooksNotifier extends ValueNotifier<BooksState> {
  BooksNotifier() : super(const BooksState(books: [], isLoading: true));
  final r = Random();

  bool get isLoading => value.isLoading;
  UnmodifiableListView<Book> get books => value.books;

  @override
  @protected
  set value(BooksState state) => super.value = state;
  @override
  @protected
  BooksState get value => super.value;

  Future<void> loadBooks() async {
    value = value.copyWith(isLoading: true);
    await Future<void>.delayed(Duration(milliseconds: r.nextInt(1000)));
    final books = List.generate(r.nextInt(100), Book.fakeFromId);
    value = value.copyWith(isLoading: false, books: books);
  }
}
