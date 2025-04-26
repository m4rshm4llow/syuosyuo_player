import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:syuosyuo_player/provider/data_provider.dart';
import 'package:syuosyuo_player/utils/string.dart';
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

    // NOTE: デスクトップ版の動画プレイヤーの最大高さを全高の50%に制限
    final constraints = switch (breakpoint.name) {
      DESKTOP => BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.5),
      _ => BoxConstraints(),
    };

    final showOverlay = useState(true);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ConstrainedBox(
                constraints: constraints,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: YoutubePlayer(controller: controller),
                ),
              ),
              // NOTE: YoutubePlayer によってタップイベントが奪われる不具合のワークアラウンド
              // ・PointerInterceptor を使用して iFrame へのイベント送信を停止するWidgetをスタックにオーバーレイ
              // ・MouseRegion を使って hover イベントを検知し、ホバー中のみオーバーレイを剥がす
              // REF: https://github.com/sarbagyastha/youtube_player_flutter/issues/434
              if (showOverlay.value)
                Positioned.fill(
                  child: PointerInterceptor(
                    child: MouseRegion(
                      onHover: (event) {
                        showOverlay.value = false;
                        Timer(const Duration(seconds: 1), () {
                          showOverlay.value = true;
                        });
                      },
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                ),
            ],
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
