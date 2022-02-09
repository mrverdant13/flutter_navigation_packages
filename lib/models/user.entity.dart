import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_navigation_packages/models/json.type.dart';

@immutable
class User extends Equatable {
  const User({
    required this.id,
    required this.username,
    required this.avatarUrl,
    this.status,
  });

  factory User.fromJson(JSON json) => User(
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

  JSON toJson() => <String, dynamic>{
        'id': id,
        'username': username,
        'avatar_url': avatarUrl,
        'status': status,
      };
}
