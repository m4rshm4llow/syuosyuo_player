import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syuosyuo_player/provider/data_provider.dart';
import 'package:syuosyuo_player/router.dart';

/// ツール系の画面
class ToolScreen extends HookConsumerWidget {
  const ToolScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // デビュー日関連
    final debutDate = ref.watch(dataProvider).valueOrNull?.debutDate ?? '';
    final formattedDebutDate = useMemoized(() {
      if (debutDate.isEmpty) return '';
      final date = DateTime.tryParse(debutDate);
      if (date == null) return '';
      return '${date.year}年${date.month}月${date.day}日';
    }, [debutDate]);
    final daysSinceDebut = useMemoized(() {
      if (debutDate.isEmpty) return '';
      final now = DateTime.now();
      return 'デビューから${now.difference(DateTime.parse(debutDate)).inDays}日';
    }, [debutDate]);

    // 総曲数
    final archives = ref.watch(dataProvider).valueOrNull?.archives ?? [];
    final songList = archives.map((e) => e.songs).expand((e) => e).toList();

    // データ不備: URL重複チェック
    final uniqueUrls = archives.map((e) => e.videoId).toSet();
    final hasDuplicateUrls = uniqueUrls.length != archives.length;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (debutDate.isNotEmpty) ...[
              ListTile(
                title: const Text('初配信日'),
                subtitle: Text(formattedDebutDate),
                trailing: Text(
                  daysSinceDebut,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(height: 1.0),
            ],
            if (archives.isNotEmpty) ...[
              ListTile(title: const Text('歌枠数'), subtitle: Text('${archives.length}')),
              Divider(height: 1.0),
            ],
            if (songList.isNotEmpty) ...[
              ListTile(title: const Text('総曲数'), subtitle: Text('${songList.length}曲')),
              Divider(height: 1.0),
            ],
            ListTile(
              title: const Text('弾幕'),
              subtitle: Text('🐱🧡🎶🐱🧡🎶'),
              trailing: IconButton(
                onPressed: () {
                  Clipboard.setData(const ClipboardData(text: '🐱🧡🎶🐱🧡🎶'));
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('弾幕をコピーしました。')));
                },
                icon: Icon(Icons.copy),
              ),
            ),
            Divider(height: 1.0),
            ListTile(
              title: const Text('拍手'),
              subtitle: Text('👏👏👏👏👏👏'),
              trailing: IconButton(
                onPressed: () {
                  Clipboard.setData(const ClipboardData(text: '👏👏👏👏👏👏'));
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('拍手をコピーしました。')));
                },
                icon: Icon(Icons.copy),
              ),
            ),
            Divider(height: 1.0),
            ListTile(
              title: const Text('動画URL重複チェック'),
              subtitle: hasDuplicateUrls ? Text('重複があります') : Text('重複はありません'),
            ),
            Divider(height: 1.0),
            ListTile(
              title: const Text('アちゃん塗り絵ツール🎨🖌️✨'),
              onTap: () {
                PaintPageRoute().go(context);
              },
            ),
            Divider(height: 1.0),
          ],
        ),
      ),
    );
  }
}
