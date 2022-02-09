import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_navigation_packages/models/channel.entity.dart';
import 'package:flutter_navigation_packages/models/json.type.dart';

final _channelsJsonFuture = rootBundle.loadString('fixtures/channels.json');

late final allChannels = () async {
  final jsonListString = await _channelsJsonFuture;
  final jsonList = jsonDecode(jsonListString) as List;
  final channels = jsonList.map((dynamic j) => Channel.fromJson(j as JSON));
  return channels;
}();
