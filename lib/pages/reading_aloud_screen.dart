import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syuosyuo_player/provider/data_provider.dart';
import 'package:syuosyuo_player/router.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ReadingAloudScreen extends HookConsumerWidget {
  const ReadingAloudScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final archives = ref.watch(dataProvider).valueOrNull?.readingAloudArchives ?? [];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 66,
            child: Row(
              children: [
                Spacer(),
                Text('${archives.length}件', style: TextStyle(fontSize: 16)),
                Gap(16),
              ],
            ),
          ),
          Divider(height: 1.0),
          Expanded(
            child: ListView.separated(
              itemCount: archives.length,
              itemBuilder: (context, index) {
                final archive = archives[index];
                final videoId = YoutubePlayerController.convertUrlToId(archive.url)!;
                return ListTile(
                  title: Text(
                    archives[index].name,
                    maxLines: 2,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  subtitle: Container(
                    padding: const EdgeInsets.only(top: 4),
                    alignment: Alignment.bottomRight,
                    child: Text(archives[index].date),
                  ),
                  leading: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      'https://img.youtube.com/vi/$videoId/0.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () {
                    WatchReadingAloudPageRoute(videoId: videoId).push(context);
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(height: 1.0),
            ),
          ),
        ],
      ),
    );
  }
}
