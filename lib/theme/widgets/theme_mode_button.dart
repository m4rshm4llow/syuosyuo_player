import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syuosyuo_player/theme/models/app_theme_mode_provider.dart';

/// ライトモード/ダークモード切り替えボタン
class ThemeModeButton extends ConsumerWidget {
  const ThemeModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeModeProvider);
    return IconButton(
      onPressed: () => ref.read(appThemeModeProvider.notifier).toggle(),
      icon: Icon(themeMode.icon),
    );
  }
}

extension ThemeModeExt on ThemeMode {
  IconData get icon => switch (this) {
    ThemeMode.dark => Icons.dark_mode_outlined,
    ThemeMode.light => Icons.light_mode_outlined,
    ThemeMode.system => Icons.contrast_outlined,
  };
}
