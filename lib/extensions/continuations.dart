import 'dart:ui';

import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'extensions.dart';

extension Wup on Widget {
  FlutterFlowIconButton getFlutterFlowIconButton(
          {Key? key,
          Color? fillColor,
          Color? hoverColor,
          double? buttonSize,
          Color? borderColor,
          double? borderWidth,
          double? borderRadius,
          Color? disabledColor,
          Color? hoverIconColor,
          Color? disabledIconColor,
          dynamic Function()? onPressed}) =>
      FlutterFlowIconButton(
          key: key,
          icon: this,
          fillColor: fillColor,
          onPressed: onPressed,
          buttonSize: buttonSize,
          hoverColor: hoverColor,
          borderColor: borderColor,
          borderWidth: borderWidth,
          borderRadius: borderRadius,
          disabledColor: disabledColor,
          hoverIconColor: hoverIconColor,
          disabledIconColor: disabledIconColor);
}

extension StrUt on String? {
  NumberFormat get fromPattern => NumberFormat(this);

  NumberFormat get fromLocale => NumberFormat(null, this);

  Locale getFromSubTags({String? scriptCode, String? countryCode}) =>
      Locale.fromSubtags(
          scriptCode: scriptCode,
          countryCode: countryCode,
          languageCode: this ?? 'und');

  ThemeMode? get tm {
    switch (this?.trimmed.lowerCased) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      case 'system':
        return ThemeMode.system;
      default:
        return null;
    }
  }
}

extension SizeUt on Size? {
  Widget constrainChild({Widget? child}) =>
      SizedBox.fromSize(size: this, child: child);
}

extension DoubUt on double? {
  Widget squareConstrainChild({Widget? child}) =>
      SizedBox.square(dimension: this, child: child);
}

extension Extension on Uint8List {
  Future<Codec> setImageCodec(
          {int? targetWidth, int? targetHeight, bool? allowUpscaling}) =>
      instantiateImageCodec(this,
          targetWidth: targetWidth,
          targetHeight: targetHeight,
          allowUpscaling: allowUpscaling ?? true);
}

extension IntUt1 on int? {
  FontWeight get fontWeight {
    switch (this) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
      default:
        return FontWeight.normal;
    }
  }
}
