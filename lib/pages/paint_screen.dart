import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:image_painter/image_painter.dart';
import 'package:intl/intl.dart';

/// アちゃんペイントツールの画面
class PaintScreen extends HookConsumerWidget {
  const PaintScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useMemoized(() => ImagePainterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('アちゃん塗り絵ツール'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('色を選択'),
                    content: SingleChildScrollView(
                      child: ColorPicker(
                        pickerColor: controller.color,
                        onColorChanged: (Color color) {
                          controller.setColor(color);
                        },
                        enableAlpha: false,
                        pickerAreaHeightPercent: 0.8,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.palette),
          ),
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: () async {
              final image = await controller.exportImage();
              if (image == null) return;
              final now = DateTime.now();
              final formatter = DateFormat('yyyyMMddHHmm');
              final fileName = 'achan_${formatter.format(now)}.png';
              WebImageDownloader.downloadImageFromUInt8List(name: fileName, uInt8List: image);
            },
          ),
        ],
      ),
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
