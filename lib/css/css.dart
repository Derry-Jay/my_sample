import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/values.dart';

class Css {
  static final Css _singleton = Css._internal();

  factory Css() => _singleton;

  Css._internal();

  final theme =
          ThemeData(useMaterial3: true, colorSchemeSeed: rainbow.kDeepPurple),
      appleTheme = CupertinoThemeData(
        primaryColor: shades.kGrey1,
      );
}
