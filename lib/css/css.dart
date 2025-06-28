import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/values.dart';

class Css {
  static final Css _singleton = Css._internal();

  factory Css() => _singleton;

  Css._internal();

  final appleTheme = CupertinoThemeData(primaryColor: shades.kGrey1),
      theme = ThemeData(
        useMaterial3: true,
        colorSchemeSeed: rainbow.kDeepPurple,
      ),
      sumStyle = 'roboto'.getStyleFromFont(
        fontSize: 20,
        color: rainbow.kDeepPurple,
        fontWeight: 'medium'.fontWeight,
      ),
      textFieldDecor = InputDecoration(
        labelText: 'Enter String',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: rainbow.kDeepPurple),
        ),
      );
}
