/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFlagsGen {
  const $AssetsFlagsGen();

  /// File path: assets/flags/id.png
  AssetGenImage get id => const AssetGenImage('assets/flags/id.png');

  /// File path: assets/flags/us.png
  AssetGenImage get us => const AssetGenImage('assets/flags/us.png');

  /// List of all assets
  List<AssetGenImage> get values => [id, us];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_left.png
  AssetGenImage get arrowLeft =>
      const AssetGenImage('assets/icons/arrow_left.png');

  /// File path: assets/icons/bank_outline.png
  AssetGenImage get bankOutline =>
      const AssetGenImage('assets/icons/bank_outline.png');

  /// File path: assets/icons/card.png
  AssetGenImage get card => const AssetGenImage('assets/icons/card.png');

  /// File path: assets/icons/card_outline.png
  AssetGenImage get cardOutline =>
      const AssetGenImage('assets/icons/card_outline.png');

  /// File path: assets/icons/check.png
  AssetGenImage get check => const AssetGenImage('assets/icons/check.png');

  /// File path: assets/icons/check_rounded.png
  AssetGenImage get checkRounded =>
      const AssetGenImage('assets/icons/check_rounded.png');

  /// File path: assets/icons/credit.png
  AssetGenImage get credit => const AssetGenImage('assets/icons/credit.png');

  /// File path: assets/icons/debit.png
  AssetGenImage get debit => const AssetGenImage('assets/icons/debit.png');

  /// File path: assets/icons/email.png
  AssetGenImage get email => const AssetGenImage('assets/icons/email.png');

  /// File path: assets/icons/info.png
  AssetGenImage get info => const AssetGenImage('assets/icons/info.png');

  /// Directory path: assets/icons/navbar
  $AssetsIconsNavbarGen get navbar => const $AssetsIconsNavbarGen();

  /// File path: assets/icons/notification.png
  AssetGenImage get notification =>
      const AssetGenImage('assets/icons/notification.png');

  /// File path: assets/icons/other.png
  AssetGenImage get other => const AssetGenImage('assets/icons/other.png');

  /// File path: assets/icons/person.png
  AssetGenImage get person => const AssetGenImage('assets/icons/person.png');

  /// File path: assets/icons/phone.png
  AssetGenImage get phone => const AssetGenImage('assets/icons/phone.png');

  /// File path: assets/icons/scan.png
  AssetGenImage get scan => const AssetGenImage('assets/icons/scan.png');

  /// File path: assets/icons/search.png
  AssetGenImage get search => const AssetGenImage('assets/icons/search.png');

  /// File path: assets/icons/transfer.png
  AssetGenImage get transfer =>
      const AssetGenImage('assets/icons/transfer.png');

  /// File path: assets/icons/wallet.png
  AssetGenImage get wallet => const AssetGenImage('assets/icons/wallet.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        arrowLeft,
        bankOutline,
        card,
        cardOutline,
        check,
        checkRounded,
        credit,
        debit,
        email,
        info,
        notification,
        other,
        person,
        phone,
        scan,
        search,
        transfer,
        wallet
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/1.png
  AssetGenImage get a1 => const AssetGenImage('assets/images/1.png');

  /// File path: assets/images/2.png
  AssetGenImage get a2 => const AssetGenImage('assets/images/2.png');

  /// File path: assets/images/3.png
  AssetGenImage get a3 => const AssetGenImage('assets/images/3.png');

  /// File path: assets/images/4.png
  AssetGenImage get a4 => const AssetGenImage('assets/images/4.png');

  /// File path: assets/images/5.png
  AssetGenImage get a5 => const AssetGenImage('assets/images/5.png');

  /// File path: assets/images/anantla_logo.png
  AssetGenImage get anantlaLogo =>
      const AssetGenImage('assets/images/anantla_logo.png');

  /// File path: assets/images/anantla_logo_black.png
  AssetGenImage get anantlaLogoBlack =>
      const AssetGenImage('assets/images/anantla_logo_black.png');

  /// File path: assets/images/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/images/icon.png');

  /// File path: assets/images/usa.png
  AssetGenImage get usa => const AssetGenImage('assets/images/usa.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [a1, a2, a3, a4, a5, anantlaLogo, anantlaLogoBlack, icon, usa];
}

class $AssetsIconsNavbarGen {
  const $AssetsIconsNavbarGen();

  /// File path: assets/icons/navbar/card.png
  AssetGenImage get card => const AssetGenImage('assets/icons/navbar/card.png');

  /// File path: assets/icons/navbar/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/navbar/home.png');

  /// File path: assets/icons/navbar/person.png
  AssetGenImage get person =>
      const AssetGenImage('assets/icons/navbar/person.png');

  /// File path: assets/icons/navbar/transfer.png
  AssetGenImage get transfer =>
      const AssetGenImage('assets/icons/navbar/transfer.png');

  /// List of all assets
  List<AssetGenImage> get values => [card, home, person, transfer];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsFlagsGen flags = $AssetsFlagsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
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
