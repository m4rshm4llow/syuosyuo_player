import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:syuosyuo_player/data/enum.dart';
import 'package:syuosyuo_player/provider/data_provider.dart';
import 'package:syuosyuo_player/router.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class SingingRelayScreen extends HookConsumerWidget {
  const SingingRelayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final archives =
        ref.watch(utawakuAchivesProvider(SortLabel.newer, FilterLabel.singingRelay)).valueOrNull ??
        [];
    final isMobile = ResponsiveBreakpoints.of(context).breakpoint.name == MOBILE;

    return Scaffold(
      body: ListView.separated(
        itemCount: archives.length,
        itemBuilder: (context, index) {
          final archive = archives[index];
          final videoId = YoutubePlayerController.convertUrlToId(archives[index].url)!;
          return InkWell(
            onTap: () {
              WatchPageRoute(videoId: videoId).push(context);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: SizedBox(
                            height: isMobile ? 100 : 144,
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.network(
                                YoutubePlayerController.getThumbnail(
                                  videoId: videoId,
                                  quality: ThumbnailQuality.high,
                                  webp: false,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(4),
                            Text(
                              archive.name,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                              maxLines: 1,
                            ),
                            Gap(8),
                            for (final song in archive.songs) ...[
                              Text(
                                isMobile ? '・${song.title}' : '・${song.title} / ${song.artist}',
                                style: TextStyle(fontSize: 12),
                                maxLines: 1,
                              ),
                              Gap(2),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (!isMobile)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Text(archive.date, style: TextStyle(fontSize: 12)),
                    ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 1.0),
      ),
    );
  }
}
