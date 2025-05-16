import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syuosyuo_player/data/data.dart';
import 'package:syuosyuo_player/provider/data_provider.dart';

part 'favorite_provider.g.dart';

const String favoriteKey = 'favorite';

/// お気に入りの歌を管理する
@Riverpod(keepAlive: true)
class Favorite extends _$Favorite {
  @override
  FutureOr<List<String>> build() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getStringList(favoriteKey) ?? [];
  }

  /// お気に入りの歌を追加する（$vidoId_$time）
  Future<void> add(String videoKey) async {
    switch (state) {
      case AsyncData(:final value):
        final sharedPref = await SharedPreferences.getInstance();
        final newValue = [...value, videoKey];
        await sharedPref.setStringList(favoriteKey, newValue);
        state = AsyncData(newValue);
    }
  }

  /// お気に入りの歌を削除する（$vidoId_$time）
  Future<void> remove(String videoKey) async {
    switch (state) {
      case AsyncData(:final value):
        final sharedPref = await SharedPreferences.getInstance();
        final newValue = value.where((e) => e != videoKey).toList();
        await sharedPref.setStringList(favoriteKey, newValue);
        state = AsyncData(newValue);
    }
  }
}

@Riverpod(keepAlive: true)
List<FavoriteSong> favoriteSongList(Ref ref) {
  final favariteVideoKeys = ref.watch(favoriteProvider).valueOrNull ?? [];
  return favariteVideoKeys.map((videoKey) {
    final videoId = videoKey.split('_')[0];
    final time = videoKey.split('_')[1];
    final song = ref.watch(songListProvider(videoId)).firstWhere((e) => e.time == time);
    return FavoriteSong(title: song.title, artist: song.artist, videoId: videoId, time: time);
  }).toList();
}
