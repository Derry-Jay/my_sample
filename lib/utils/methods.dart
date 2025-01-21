import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

import '../states/common_state.dart';

CommonState obtainCommonState() => CommonState();

Widget numberBuilder(CommonState cm) {
  return Center(child: cm.itemCount.string.textWidget());
}
