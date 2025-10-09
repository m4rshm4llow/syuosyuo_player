import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_painter/image_painter.dart';

/// アちゃんペイントツールの画面
class PaintScreen extends HookConsumerWidget {
  const PaintScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useMemoized(() => ImagePainterController());

    return Scaffold(
      appBar: AppBar(title: const Text('アちゃん塗り絵ツール')),
      body: ImagePainter.network(
        'https://pbs.twimg.com/media/G1JntFhawAA81GZ?format=jpg&name=4096x4096',
        controller: controller,
        scalable: true,
        textDelegate: TextDelegate(),
        controlsBackgroundColor: Theme.of(context).colorScheme.surface,
        clearAllIcon: Icon(Icons.delete, color: Colors.grey[700]),
        colors: [
          Colors.black,
          Colors.white,
          Colors.red,
          Colors.orange,
          Colors.yellow,
          Colors.green,
          Colors.blue,
          Colors.indigo,
          Colors.purple,
          Colors.brown,
          Colors.pink,
          Colors.grey,
          // カスタムカラー
          const Color(0xFFFFDBB5),
          const Color(0xFF2CDCD1),
          const Color(0xFF397891),
          const Color(0xFF8FE4E8),
        ],
      ),
    );
  }
}
