import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:intl/intl.dart';
import 'package:pro_image_editor/core/models/editor_callbacks/pro_image_editor_callbacks.dart';
import 'package:pro_image_editor/core/models/editor_configs/pro_image_editor_configs.dart';
import 'package:pro_image_editor/features/main_editor/main_editor.dart';

/// アちゃんペイントツールの画面
class PaintScreen extends HookConsumerWidget {
  const PaintScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ProImageEditor.network(
        'https://pbs.twimg.com/media/G1JntFhawAA81GZ?format=jpg&name=4096x4096',
        configs: ProImageEditorConfigs(
          mainEditor: MainEditorConfigs(
            enableCloseButton: false,
            icons: MainEditorIcons(doneIcon: Icons.save_alt),
          ),
          paintEditor: PaintEditorConfigs(
            enableZoom: true,
            enableModeBlur: false,
            enableModeEraser: false,
          ),
          blurEditor: BlurEditorConfigs(enabled: false),
          emojiEditor: EmojiEditorConfigs(enabled: false),
          textEditor: TextEditorConfigs(initialBackgroundColorMode: LayerBackgroundMode.onlyColor),
          filterEditor: FilterEditorConfigs(enabled: false),
          tuneEditor: TuneEditorConfigs(enabled: false),
        ),
        callbacks: ProImageEditorCallbacks(
          onImageEditingComplete: (Uint8List bytes) async {
            final now = DateTime.now();
            final formatter = DateFormat('yyyyMMddHHmm');
            final fileName = 'achan_${formatter.format(now)}.png';
            WebImageDownloader.downloadImageFromUInt8List(name: fileName, uInt8List: bytes);
          },
        ),
      ),
    );
  }
}
