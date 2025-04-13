import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_mode_provider.g.dart';

@Riverpod(keepAlive: true)
class AppThemeMode extends _$AppThemeMode {
  @override
  ThemeMode build() {
    var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return switch (brightness) {
      Brightness.dark => ThemeMode.dark,
      Brightness.light => ThemeMode.light,
    };
  }

  void toggle() {
    switch (state) {
      case ThemeMode.dark:
        state = ThemeMode.light;
      case ThemeMode.light:
        state = ThemeMode.dark;
      case ThemeMode.system:
        break;
    }
  }
}
