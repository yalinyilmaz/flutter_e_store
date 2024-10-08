/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/info.png
  AssetGenImage get info => const AssetGenImage('assets/icons/info.png');

  /// File path: assets/icons/success.png
  AssetGenImage get success => const AssetGenImage('assets/icons/success.png');

  /// List of all assets
  List<AssetGenImage> get values => [info, success];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/advertisement_img.png
  AssetGenImage get advertisementImg =>
      const AssetGenImage('assets/images/advertisement_img.png');

  /// File path: assets/images/board_guy.png
  AssetGenImage get boardGuy =>
      const AssetGenImage('assets/images/board_guy.png');

  /// File path: assets/images/example_img.png
  AssetGenImage get exampleImg =>
      const AssetGenImage('assets/images/example_img.png');

  /// File path: assets/images/facebook_icon.png
  AssetGenImage get facebookIcon =>
      const AssetGenImage('assets/images/facebook_icon.png');

  /// File path: assets/images/female.png
  AssetGenImage get female => const AssetGenImage('assets/images/female.png');

  /// File path: assets/images/google_icon.png
  AssetGenImage get googleIcon =>
      const AssetGenImage('assets/images/google_icon.png');

  /// File path: assets/images/infos.png
  AssetGenImage get infos => const AssetGenImage('assets/images/infos.png');

  /// File path: assets/images/kid.png
  AssetGenImage get kid => const AssetGenImage('assets/images/kid.png');

  /// File path: assets/images/main_logo.png
  AssetGenImage get mainLogo =>
      const AssetGenImage('assets/images/main_logo.png');

  /// File path: assets/images/male.png
  AssetGenImage get male => const AssetGenImage('assets/images/male.png');

  /// File path: assets/images/shoes1.png
  AssetGenImage get shoes1 => const AssetGenImage('assets/images/shoes1.png');

  /// File path: assets/images/shoes2.png
  AssetGenImage get shoes2 => const AssetGenImage('assets/images/shoes2.png');

  /// File path: assets/images/shoes3.png
  AssetGenImage get shoes3 => const AssetGenImage('assets/images/shoes3.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        advertisementImg,
        boardGuy,
        exampleImg,
        facebookIcon,
        female,
        googleIcon,
        infos,
        kid,
        mainLogo,
        male,
        shoes1,
        shoes2,
        shoes3
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
