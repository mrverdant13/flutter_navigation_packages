import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_navigation_packages/models/json.type.dart';
import 'package:flutter_navigation_packages/models/user.entity.dart';

final _usersJsonFuture = rootBundle.loadString('fixtures/users.json');

late final allUsers = () async {
  final jsonListString = await _usersJsonFuture;
  final jsonList = jsonDecode(jsonListString) as List;
  final users = jsonList.map((dynamic j) => User.fromJson(j as JSON));
  return users;
}();
