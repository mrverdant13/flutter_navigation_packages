import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class User extends Equatable {
  const User({
    required this.id,
    required this.username,
    required this.avatarUrl,
    this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int,
        username: json['username'] as String,
        avatarUrl: json['avatarUrl'] as String,
        status: json['status'] as String?,
      );

  final int id;
  final String username;
  final String avatarUrl;
  final String? status;

  @override
  List<Object?> get props => [id, username, avatarUrl, status];
}
