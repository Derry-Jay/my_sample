import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:june/june.dart';

extension StrExt on String? {
  int get sum {
    try {
      final String ip = trimmed.replaceAll(r'//'.re(), '');
      if (ip.isEmpty) {
        return 0;
      } else {
        final List<String> pts = ip.hew('\n');
        final bool flag =
            !(pts.isEmpty || pts.isSingle) && pts.first.toInt() < 0;
        final List<String> temp = flag
            ? pts.last.hew(pts.first)
            : ip.hewWithMultipleDelimiters(<String>[
                ' ',
                ',',
                ';',
                ':',
                '.',
                '-',
                '_',
                '\\',
                '/',
                '.',
                '^',
                '*',
                '%',
                '!',
                '=',
                '?',
                '@',
                '#',
                '\$',
                '&',
                '+',
              ]);
        temp.jot();
        List<int> nos = temp.map<int>((String str) {
          str.jot();
          return str.toInt();
        }).toList();
        return nos.sum.integer;
      }
    } catch (e) {
      e.jot();
      return 0;
    }
  }
}

extension Helper<T extends BuildContext> on T {}

extension Zxcvb<T extends JuneState> on T Function() {
  T state({String? tag, bool? permanent}) =>
      June.getState<T>(this, tag: tag, permanent: permanent ?? true);

  JuneBuilder<T> builderJune(Widget Function(T) builder) =>
      JuneBuilder<T>(this, builder: builder);
}
