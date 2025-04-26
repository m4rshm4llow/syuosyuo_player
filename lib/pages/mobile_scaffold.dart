import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syuosyuo_player/gen/assets.gen.dart';
import 'package:syuosyuo_player/pages/main_scaffold.dart';
import 'package:syuosyuo_player/provider/data_provider.dart';
import 'package:syuosyuo_player/router.dart';
import 'package:syuosyuo_player/theme/widgets/theme_mode_button.dart';
import 'package:syuosyuo_player/utils/string.dart';
import 'package:url_launcher/link.dart';

/// モバイル用のホーム画面
class MobileScaffold extends StatelessWidget {
  const MobileScaffold(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const NavigationTitle(),
        centerTitle: false,
        elevation: 4,
        actions: [
          ThemeModeButton(),
          IconButton(
            onPressed: () {
              SearchPageRoute().go(context);
            },
            icon: Icon(Icons.search),
          ),
          const Gap(8),
        ],
      ),
      body: navigationShell,
      drawer: _Drawer(navigationShell: navigationShell),
    );
  }
}

class _Drawer extends HookConsumerWidget {
  const _Drawer({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // もちしゅおの跳ねるアニメーション
    final controller = useAnimationController(duration: const Duration(milliseconds: 1000));
    final animation = useMemoized(() {
      return Tween<double>(
        begin: -10,
        end: 10,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    }, [controller]);

    useEffect(() {
      // NOTE: ドロワー展開アニメーションが終わるまで適当に待ってからアニメーションを開始
      Future.delayed(const Duration(milliseconds: 200), () {
        controller.repeat();
      });
      return;
    }, [controller]);

    // ドロワーを開くたびに5種類のもちしゅおをランダムに表示する
    final image = useMemoized(() {
      final values = Assets.images.values.where((e) => e.keyName.contains('mochi_syuo')).toList();
      final randomIndex = Random().nextInt(values.length);
      return values[randomIndex];
    }, const []);

    final links = ref.watch(dataProvider).valueOrNull?.links ?? [];
    final lastUpdatedAt = ref.watch(dataProvider).valueOrNull?.lastUpdated ?? '';

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Row(
              children: [
                AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return Transform.translate(offset: Offset(0, animation.value), child: child);
                  },
                  child: image.image(width: 100, height: 100, filterQuality: FilterQuality.high),
                ),
                Flexible(
                  child: Text(
                    'チャンネル登録・高評価よろしくお願いします！',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('ホーム'),
            onTap: () {
              Navigator.of(context).pop();
              HomePageRoute().go(context);
            },
          ),
          ListTile(
            title: Text('歌枠一覧'),
            onTap: () {
              Navigator.of(context).pop();
              AchivesPageRoute().go(context);
            },
          ),
          ListTile(
            title: Text('歌唱曲一覧'),
            onTap: () {
              Navigator.of(context).pop();
              SongPageRoute().go(context);
            },
          ),
          ListTile(
            title: Text('アーティスト一覧'),
            onTap: () {
              Navigator.of(context).pop();
              ArtistsPageRoute().go(context);
            },
          ),
          ListTile(
            title: Text('サムネイルギャラリー'),
            onTap: () {
              Navigator.of(context).pop();
              ThumbnailPageRoute().go(context);
            },
          ),
          ListTile(
            title: Text('ツール'),
            onTap: () {
              Navigator.of(context).pop();
              ToolPageRoute().go(context);
            },
          ),
          Divider(height: 1.0),
          for (final link in links)
            Link(
              uri: Uri.parse(link.url),
              target: LinkTarget.blank,
              builder: (context, followLink) {
                return ListTile(title: Text(link.title), onTap: followLink);
              },
            ),
          Divider(height: 1.0),
          ListTile(
            title: Text('ライセンス'),
            onTap: () {
              showLicensePage(context: context);
            },
          ),
          ListTile(
            title: Text('クレジット'),
            onTap: () {
              Navigator.of(context).pop();
              CreditPageRoute().go(context);
            },
          ),
          if (lastUpdatedAt.isNotEmpty) ...[
            Divider(height: 1.0),
            ListTile(title: Text('最終更新日'), subtitle: Text(lastUpdatedAt.formatDate())),
          ],
        ],
      ),
    );
  }
}
