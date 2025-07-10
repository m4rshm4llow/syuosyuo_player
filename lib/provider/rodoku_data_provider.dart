import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syuosyuo_player/data/data.dart';
import 'package:syuosyuo_player/data/enum.dart';
import 'package:syuosyuo_player/data/rodoku.dart';
import 'package:syuosyuo_player/gen/assets.gen.dart';

part 'rodoku_data_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<RodokuData> rodokuData(Ref ref) async {
  final json = await rootBundle.loadString(Assets.json.rodoku);
  return RodokuData.fromJson(jsonDecode(json));
}

@Riverpod(keepAlive: true)
FutureOr<List<RodokuArchive>> rodokuDataAchives(Ref ref, SortLabel sortLabel) async {
  final archives = ref.watch(rodokuDataProvider).valueOrNull?.archives.toList() ?? [];
  // ソート
  switch (sortLabel) {
    case SortLabel.newer:
      archives.sort((a, b) => b.date.compareTo(a.date));
    case SortLabel.older:
      archives.sort((a, b) => a.date.compareTo(b.date));
  }
  return archives;
}

@riverpod
List<Timestamp> rodokuTimestampList(Ref ref, String videoId) {
  final archives = ref.watch(rodokuDataProvider).valueOrNull?.archives ?? [];
  return archives.firstWhere((e) => e.url.contains(videoId)).timestamps;
}
