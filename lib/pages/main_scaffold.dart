import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:syuosyuo_player/pages/mobile_scaffold.dart';
import 'package:syuosyuo_player/provider/data_provider.dart';
import 'package:syuosyuo_player/router.dart';
import 'package:syuosyuo_player/theme/widgets/theme_mode_button.dart';
import 'package:syuosyuo_player/utils/string.dart';
import 'package:url_launcher/link.dart';

class MainScaffold extends HookConsumerWidget {
  const MainScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            title: Text('歌枠リレー参加一覧'),
            onTap: () {
              SingingRealyPageRoute().go(context);
            },
          ),
          ListTile(
            title: Text('サムネイルギャラリー'),
            onTap: () {
              ThumbnailPageRoute().go(context);
            },
          ),
          Divider(height: 1.0),
          ListTile(
            title: Text('朗読一覧'),
            onTap: () {
              ReadingAloudPageRoute().go(context);
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
