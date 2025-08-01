/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/mochi_syuo.webp
  AssetGenImage get mochiSyuo => const AssetGenImage('assets/images/mochi_syuo.webp');

  /// File path: assets/images/mochi_syuo_angry.webp
  AssetGenImage get mochiSyuoAngry => const AssetGenImage('assets/images/mochi_syuo_angry.webp');

  /// File path: assets/images/mochi_syuo_crying.webp
  AssetGenImage get mochiSyuoCrying => const AssetGenImage('assets/images/mochi_syuo_crying.webp');

  /// File path: assets/images/mochi_syuo_drooling.webp
  AssetGenImage get mochiSyuoDrooling =>
      const AssetGenImage('assets/images/mochi_syuo_drooling.webp');

  /// File path: assets/images/mochi_syuo_smiling.webp
  AssetGenImage get mochiSyuoSmiling =>
      const AssetGenImage('assets/images/mochi_syuo_smiling.webp');

  /// List of all assets
  List<AssetGenImage> get values => [
    mochiSyuo,
    mochiSyuoAngry,
    mochiSyuoCrying,
    mochiSyuoDrooling,
    mochiSyuoSmiling,
  ];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/data.json
  String get data => 'assets/json/data.json';

  /// File path: assets/json/rodoku.json
  String get rodoku => 'assets/json/rodoku.json';

  /// List of all assets
  List<String> get values => [data, rodoku];
}

class $AssetsLicenseGen {
  const $AssetsLicenseGen();

  /// File path: assets/license/OFL.txt
  String get ofl => 'assets/license/OFL.txt';

  /// List of all assets
  List<String> get values => [ofl];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
  static const $AssetsLicenseGen license = $AssetsLicenseGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
