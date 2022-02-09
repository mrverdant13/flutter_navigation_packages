import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Channel extends Equatable {
  const Channel({
    required this.id,
    required this.emoji,
    required this.name,
  });

  factory Channel.fromMap(Map<String, dynamic> map) => Channel(
        id: map['id'] as int,
        emoji: map['emoji'] as String,
        name: map['name'] as String,
      );

  final int id;
  final String emoji;
  final String name;

  @override
  List<Object> get props => [id, emoji, name];
}
