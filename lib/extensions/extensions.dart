import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:june/june.dart';

extension Wup on String {
  T? valFromConfig<T extends Object?>() => gc?.getValue<T>(trimmed);
}

extension Assist on Map<String, Object?> {}

extension Helper<T extends BuildContext> on T {}

extension Zxcvb<T extends JuneState> on T Function() {
  T state({String? tag, bool? permanent}) =>
      June.getState<T>(this, tag: tag, permanent: permanent ?? true);

  JuneBuilder<T> builderJune(Widget Function(T) builder) =>
      JuneBuilder<T>(this, builder: builder);
}
