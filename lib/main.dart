import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

import 'my_app.dart';

void main() async {
  try {
    initApp('config');
    (wb?.buildOwner?.debugBuilding ?? true)
        ? doNothing()
        : runApp(const MyApp());
  } catch (e) {
    e.jot();
  }
}
