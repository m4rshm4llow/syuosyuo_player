import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:syuosyuo_player/provider/data_provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class WatchScreen extends HookConsumerWidget {
  const WatchScreen({required this.videoId, super.key});
  final String videoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(songListProvider(videoId));
    final controller = useMemoized<YoutubePlayerController>(() {
      return YoutubePlayerController.fromVideoId(
        videoId: videoId,
        // NOTE: 自動再生を有効にしてしまうと元動画の再生数にカウントされないようなので注意
        autoPlay: false,
        params: const YoutubePlayerParams(
          showControls: true,
          captionLanguage: 'ja',
          interfaceLanguage: 'ja',
        ),
      );
    }, [videoId]);

    final breakpoint = ResponsiveBreakpoints.of(context).breakpoint;
    final maxWidth = switch (breakpoint.name) {
      DESKTOP => MediaQuery.sizeOf(context).width * 0.75,
      _ => MediaQuery.sizeOf(context).width,
    };

    return Scaffold(
      body: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: YoutubePlayer(controller: controller),
          ),
          Gap(8),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return ListTile(
                  title: Text(song.title),
                  subtitle: Text(song.artist),
                  trailing: Text(song.time),
                  onTap: () {
                    controller.seekTo(seconds: song.time.toSeconds(), allowSeekAhead: true);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension StringX on String {
  double toSeconds() {
    List<String> parts = split(':');
    if (parts.length != 3) {
      throw FormatException('Invalid time format. Expected HH:MM:SS');
    }

    double hours = double.parse(parts[0]);
    double minutes = double.parse(parts[1]);
    double seconds = double.parse(parts[2]);

    return hours * 3600 + minutes * 60 + seconds;
  }
}
