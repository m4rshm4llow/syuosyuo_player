import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:syuosyuo_player/gen/assets.gen.dart';
import 'package:syuosyuo_player/pages/mobile_scaffold.dart';
import 'package:syuosyuo_player/provider/data_provider.dart';
import 'package:syuosyuo_player/router.dart';
import 'package:syuosyuo_player/theme/widgets/theme_mode_button.dart';
import 'package:url_launcher/link.dart';

class MainScaffold extends HookConsumerWidget {
  const MainScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1秒なうろーでぃんぐ表示（日本語フォントがぐしゃるのを回避）
    final pendingFonts = useMemoized(() async {
      await Future.delayed(const Duration(seconds: 1));
    });
    final future = useFuture(pendingFonts);
    if (future.connectionState == ConnectionState.waiting) {
      return Scaffold(body: Center(child: _NowLoadingMochiShuo()));
    }

    final breakpoint = ResponsiveBreakpoints.of(context).breakpoint;
    return switch (breakpoint.name) {
      MOBILE || TABLET => MobileScaffold(navigationShell),
      (_) => PcScaffold(navigationShell),
    };
  }
}

class PcScaffold extends StatelessWidget {
  const PcScaffold(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
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
      body: Row(
        children: [
          _Drawer(),
          VerticalDivider(thickness: 1, width: 1, color: colorScheme.primary.withAlpha(30)),
          Expanded(child: navigationShell),
        ],
      ),
    );
  }
}

enum NavigationItem {
  dashboard(iconData: Icons.dashboard_outlined),
  users(iconData: Icons.list_outlined);

  const NavigationItem({required this.iconData});
  final IconData iconData;
  String get label => name;
}

class NavigationTitle extends StatelessWidget {
  const NavigationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SelectionContainer.disabled(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Visibility(
          visible: ResponsiveBreakpoints.of(context).largerThan(MOBILE),
          child: GestureDetector(
            onTap: () => const HomePageRoute().go(context),
            child: Text(
              'しゅおしゅおプレイヤー',
              style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}

class _Drawer extends HookConsumerWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final links = ref.watch(dataProvider).valueOrNull?.links ?? [];
    final lastUpdatedAt = ref.watch(dataProvider).valueOrNull?.lastUpdated ?? '';

    return Container(
      width: 240,
      padding: const EdgeInsets.all(16),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text('歌枠一覧'),
            onTap: () {
              AchivesPageRoute().go(context);
            },
          ),
          ListTile(
            title: Text('歌唱曲一覧'),
            onTap: () {
              SongPageRoute().go(context);
            },
          ),
          ListTile(
            title: Text('アーティスト一覧'),
            onTap: () {
              ArtistsPageRoute().go(context);
            },
          ),
          ListTile(
            title: Text('サムネイルギャラリー'),
            onTap: () {
              ThumbnailPageRoute().go(context);
            },
          ),
          ListTile(
            title: Text('ツール'),
            onTap: () {
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

/// フォントローディング後に少しだけ表示するもちしゅお
class _NowLoadingMochiShuo extends HookConsumerWidget {
  const _NowLoadingMochiShuo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // フォントの読み込みを待機する
    final pendingFonts = useMemoized(() async {
      await GoogleFonts.pendingFonts([GoogleFonts.sawarabiGothic()]);
    });
    final future = useFuture(pendingFonts);
    if (future.connectionState == ConnectionState.waiting) {
      return const SizedBox.shrink();
    }
    final controller = useAnimationController(duration: const Duration(milliseconds: 500))
      ..repeat();
    final animation = useMemoized(() {
      return Tween<double>(
        begin: -10,
        end: 10,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    }, [controller]);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.translate(offset: Offset(0, animation.value), child: child);
          },
          child: Assets.images.mochiSyuoSmiling.image(width: 100, height: 100),
        ),
        Gap(16),
        Text('なうろーでぃんぐ...'),
      ],
    );
  }
}
