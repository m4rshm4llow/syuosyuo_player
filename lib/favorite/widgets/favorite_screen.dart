import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syuosyuo_player/favorite/models/favorite_provider.dart';
import 'package:syuosyuo_player/gen/assets.gen.dart';
import 'package:syuosyuo_player/router.dart';
import 'package:syuosyuo_player/utils/string.dart';

class FavoriteScreen extends HookConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(favoriteSongListProvider);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 66,
            child: Row(
              children: [
                Spacer(),
                Text('${result.length}件', style: TextStyle(fontSize: 16)),
                Gap(16),
              ],
            ),
          ),
          Divider(height: 1.0),
          if (result.isEmpty)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.mochiSyuoDrooling.image(width: 100),
                    Gap(8),
                    Text('お気に入りの曲を追加しよう', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: ListView.separated(
                itemCount: result.length,
                itemBuilder: (_, index) {
                  final song = result[index];
                  return Dismissible(
                    key: ValueKey(song.videoId),
                    onDismissed: (direction) {
                      ref.read(favoriteProvider.notifier).remove(song.videoKey);
                    },
                    confirmDismiss: (direction) async {
                      var result = await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('お気に入りから削除しますか？'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(false),
                                child: Text('キャンセル'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                child: Text('削除'),
                              ),
                            ],
                          );
                        },
                      );
                      return Future.value(result);
                    },
                    direction: DismissDirection.endToStart,
                    child: ListTile(
                      minTileHeight: 66,
                      onTap: () {
                        WatchPageRoute(
                          videoId: song.videoId,
                          start: song.time.toSeconds(),
                        ).push(context);
                      },
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.network(
                            'https://img.youtube.com/vi/${song.videoId}/0.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(song.title, overflow: TextOverflow.ellipsis),
                      subtitle: Text(song.artist, overflow: TextOverflow.ellipsis),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(height: 1.0),
              ),
            ),
        ],
      ),
    );
  }
}
