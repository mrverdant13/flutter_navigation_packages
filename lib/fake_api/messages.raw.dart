import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_navigation_packages/fake_api/users.raw.dart';
import 'package:flutter_navigation_packages/models/json.type.dart';
import 'package:flutter_navigation_packages/models/messages.entity.dart';

final _messagesJsonFuture = rootBundle.loadString('fixtures/messages.json');

late final allMessages = () async {
  final users = (await allUsers).toList();
  final jsonListString = await _messagesJsonFuture;
  final jsonList = jsonDecode(jsonListString) as List;
  final messages = jsonList.map(
    (dynamic j) {
      final json = j as JSON;
      final senderId = json['sender_id'] as int;
      final sender = users.singleWhere((u) => u.id == senderId);
      json['sender'] = sender;
      return Message.fromJson(json);
    },
  );
  return messages;
}();
