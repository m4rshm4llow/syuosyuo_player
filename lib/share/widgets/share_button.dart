import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syuosyuo_player/data/data.dart';
import 'package:syuosyuo_player/utils/string.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareButton extends ConsumerWidget {
  const ShareButton({required this.song, required this.videoId, super.key});
  final Song song;
  final String videoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        try {
          final title = '♪ ${song.title} / ${song.artist}';
          final ytUrl = 'https://youtu.be/$videoId?t=${song.time.toSeconds()}';
          final hashTag = '#秋桜しゅお #vtuber #vsinger';
          final appName = 'しゅおしゅおプレイヤー';
          final shareText = '$title\n\n$ytUrl\n\n$hashTag\n#$appName';
          final encodedText = Uri.encodeComponent(shareText);
          final uri = Uri.parse('https://twitter.com/intent/tweet?text=$encodedText');
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Xアプリを開けませんでした'), duration: Duration(seconds: 2)),
              );
            }
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('シェアに失敗しました'), duration: Duration(seconds: 2)),
            );
          }
        }
      },
      icon: const Icon(Icons.ios_share_rounded),
    );
  }
}
