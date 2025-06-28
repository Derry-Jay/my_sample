import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

import '../states/common_state.dart';
import 'values.dart';

CommonState stateCommon() => CommonState();

Widget sumBuilder(CommonState cm) {
  return 'SUM: ${cm.total}'.toTextWidget(style: css.sumStyle);
}

Widget numberBuilder(CommonState cm) {
  return Center(child: cm.itemCount.string.toTextWidget());
}
