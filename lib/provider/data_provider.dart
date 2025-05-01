import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syuosyuo_player/data/data.dart';
import 'package:syuosyuo_player/data/enum.dart';
import 'package:syuosyuo_player/gen/assets.gen.dart';

part 'data_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<Data> data(Ref ref) async {
  final json = await rootBundle.loadString(Assets.json.data);
  return Data.fromJson(jsonDecode(json));
}

@Riverpod(keepAlive: true)
FutureOr<List<Archive>> utawakuAchives(
  Ref ref,
  SortLabel sortLabel,
  FilterLabel filterLabel,
) async {
  final archives =
      ref.watch(dataProvider).valueOrNull?.archives.where((e) => e.songs.isNotEmpty).toList() ?? [];
  // ソート
  switch (sortLabel) {
    case SortLabel.newer:
      archives.sort((a, b) => b.date.compareTo(a.date));
    case SortLabel.older:
      archives.sort((a, b) => a.date.compareTo(b.date));
  }
  // フィルタリング
  switch (filterLabel) {
    case FilterLabel.all:
      return archives;
    default:
      return archives.where((e) => e.name.contains(filterLabel.label)).toList();
  }
}

@Riverpod(keepAlive: true)
Map<Song, int> titleCount(Ref ref, EraLabel eraLabel) {
  // すべてのタイトルを取得する（toSetで重複除外）
  final archives = ref.watch(dataProvider).valueOrNull?.archives ?? [];
  final titleList =
      archives
          .map(
            (e) =>
                e.songs
                    // 元号でフィルタリング
                    .where((e) => e.year >= eraLabel.start && e.year < eraLabel.end)
                    .map((e) => e.title)
                    .toSet(),
          )
          .toList();
  final titles = titleList.expand((e) => e).toList();
  // タイトルの出現回数をカウントする
  final titleCount = <String, int>{};
  for (final title in titles) {
    titleCount[title] = (titleCount[title] ?? 0) + 1;
  }
  final sortedTitleCount = Map.fromEntries(
    titleCount.entries.toList()..sort((a, b) => b.value.compareTo(a.value)),
  );
  // 曲名をキーにして、曲の情報を取得する
  final songs = archives.expand((e) => e.songs).toList();
  final songCount = <Song, int>{};
  for (final entry in sortedTitleCount.entries) {
    final song = songs.firstWhere((s) => s.title == entry.key);
    songCount[song] = entry.value;
  }
  return songCount;
}

@Riverpod(keepAlive: true)
Map<Song, int> artistCount(Ref ref) {
  // アーティストの出現配信数をカウントする
  final archives = ref.watch(dataProvider).valueOrNull?.archives ?? [];
  final artistList = archives.map((e) => e.songs.map((e) => e.artist).toSet()).toList();
  final artists = artistList.expand((e) => e).where((e) => e.isNotEmpty).toList();
  final artistCount = <String, int>{};
  for (final artist in artists) {
    artistCount[artist] = (artistCount[artist] ?? 0) + 1;
  }
  final sortedArtistCount = Map.fromEntries(
    artistCount.entries.toList()..sort((a, b) => b.value.compareTo(a.value)),
  );
  // 曲名をキーにして、曲の情報を取得する
  final songs = archives.expand((e) => e.songs).toList();
  final songCount = <Song, int>{};
  for (final entry in sortedArtistCount.entries) {
    final song = songs.firstWhere((s) => s.artist == entry.key);
    songCount[song] = entry.value;
  }
  return songCount;
}

@riverpod
List<Song> songList(Ref ref, String videoId) {
  final archives = ref.watch(dataProvider).valueOrNull?.archives ?? [];
  return archives.firstWhere((e) => e.url.contains(videoId)).songs;
}

@riverpod
List<ReadingAloudArchive> readingAloud(Ref ref, SortLabel sortLabel) {
  final archives = ref.watch(dataProvider).valueOrNull?.readingAloudArchives ?? [];
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
List<Timestamp> readingAloudTimestampList(Ref ref, String videoId) {
  final archives = ref.watch(dataProvider).valueOrNull?.readingAloudArchives ?? [];
  return archives.firstWhere((e) => e.url.contains(videoId)).timestamps;
}
