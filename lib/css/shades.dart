import 'package:flutter/material.dart';

import '../models/common/shade.dart';

class Shades {
  static final Shades _singleton = Shades._internal();

  factory Shades() => _singleton;

  Shades._internal();

  final Color kGrey1 = Shade(1, 'grey').fromConfigs,
      kGold1 = Shade(1, 'gold').fromConfigs,
      kBlack1 = Shade(1, 'black').fromConfigs;
}
