import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_navigation_packages/models/json.type.dart';
import 'package:flutter_navigation_packages/models/user.entity.dart';

@immutable
class Message extends Equatable {
  const Message({
    required this.id,
    required this.channelId,
    required this.sernder,
    required this.date,
    required this.content,
  });

  factory Message.fromJson(JSON json) => Message(
        id: json['id'] as int,
        channelId: json['channel_id'] as int,
        sernder: User.fromJson(json['sernder'] as JSON),
        date: DateTime.parse(json['data_time'] as String),
        content: json['content'] as String,
      );

  final int id;
  final int channelId;
  final User sernder;
  final DateTime date;
  final String content;

  @override
  List<Object> get props => [id, channelId, sernder, date, content];
}
