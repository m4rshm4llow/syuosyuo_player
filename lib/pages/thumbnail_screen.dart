import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syuosyuo_player/data/enum.dart';
import 'package:syuosyuo_player/provider/data_provider.dart';
import 'package:syuosyuo_player/router.dart';

/// 歌枠サムネ一覧
class ThumbnailScreen extends HookConsumerWidget {
  const ThumbnailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final archives =
        ref.watch(utawakuAchivesProvider(SortLabel.newer, FilterLabel.all)).valueOrNull ?? [];
    final videoIds = archives.map((e) => e.videoId).toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 16 / 9,
              ),
              delegate: SliverChildBuilderDelegate((_, int index) {
                final videoId = videoIds[index];
                return GestureDetector(
                  onTap: () => WatchPageRoute(videoId: videoId).push(context),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2.0),
                    child: Image.network(
                      'https://img.youtube.com/vi/$videoId/hqdefault.jpg',
                      errorBuilder: (context, error, stackTrace) {
                        return ColoredBox(color: Colors.grey, child: Icon(Icons.error));
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }, childCount: videoIds.length),
            ),
          ),
        ],
      ),
    );
  }
}
