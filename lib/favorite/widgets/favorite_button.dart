import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syuosyuo_player/favorite/models/favorite_provider.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({required this.videoKey, super.key});
  final String videoKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (icon, action) = switch (ref.watch(favoriteProvider)) {
      AsyncData(:final value) when value.contains(videoKey) => (
        Icon(Icons.favorite_rounded, color: Colors.orange),
        ref.read(favoriteProvider.notifier).remove,
      ),
      _ => (Icon(Icons.favorite_border_rounded), ref.read(favoriteProvider.notifier).add),
    };
    return IconButton(onPressed: () => action(videoKey), icon: icon);
  }
}
