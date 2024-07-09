import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:june/june.dart';

import '../extensions/extensions.dart';
import '../states/common_state.dart';
import '../views/widgets/common/circular_loader.dart';
import 'enums.dart';

void rollbackOrientations() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void lockScreenRotation() async {
  await SystemChrome.setPreferredOrientations([
    // DeviceOrientation.landscapeRight,
    // DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
  ]);
}

void showStatusBar() async {
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
}

void hideLoader({Duration? time, LoaderType? type}) {
  void removeLoader() {
    try {
      overlayLoader(time: time, type: type).remove();
    } catch (e) {
      e.jot();
    }
  }

  time?.getTimer(removeLoader).cancel();
}

void doNothing() {}

Widget appleDefaultContextBuilder(
    BuildContext context, EditableTextState editableTextState) {
  return CupertinoAdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState);
}

Widget materialDefaultContextBuilder(
    BuildContext context, EditableTextState editableTextState) {
  return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState);
}

OverlayEntry overlayLoader({Duration? time, LoaderType? type}) {
  Widget loaderBuilder(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        width: context.width,
        height: context.height,
        child: Material(
            color: context.themeMaterial.primaryColor.withOpacity(0.5),
            child: CircularLoader(
                duration: time,
                loaderType: type,
                color: context.themeMaterial.primaryColor)));
  }

  return OverlayEntry(builder: loaderBuilder);
}

String emptyString() => '';

CommonState obtainCommonState() => CommonState();

bool onBadCertificate(X509Certificate cert, String host, int port) {
  return cert.isValid;
}

bool isImagePath(String str) {
  str.jot();
  return str.isImagePath;
}

T getState<T extends JuneState>(T Function() dependency,
        {String? tag, bool? permanent}) =>
    June.getState<T>(dependency, tag: tag, permanent: permanent ?? true);

bool predicate(Route<dynamic> route) {
  route.jot();
  return false;
}

Icon obtainStar(int index) {
  return index.filledStar;
}

Icon obtainStarOutline(int index) {
  return index.outlinedStar;
}

bool isFirstRoute(Route route) {
  route.jot();
  return route.isFirst;
}

bool isActiveRoute(Route route) {
  route.jot();
  return route.isActive;
}

bool isCurrentRoute(Route route) {
  route.jot();
  return route.isCurrent;
}

bool predicate4(Route route) {
  route.jot();
  return route.hasActiveRouteBelow;
}

bool predicate5(Route route) {
  route.jot();
  return route.willHandlePopInternally;
}

double getDoubleData(Map<String, dynamic> data) {
  return (data['data'] as double);
}

bool getBoolData(Map<String, dynamic> data) {
  return (data['data'] as bool);
}

String getData(List<int> values) {
  return base64.encode(values);
}

String getCommonPattern(String s, String t) {
  List<List<int>> l =
      List.generate(s.length + 1, (_) => List.filled(t.length + 1, 0));
  int z = 0;
  List<String> ret = [];

  for (int i = 1; i <= s.length; i++) {
    for (int j = 1; j <= t.length; j++) {
      if (s[i - 1] == t[j - 1]) {
        if (i == 1 || j == 1) {
          l[i][j] = 1;
        } else {
          l[i][j] = l[i - 1][j - 1] + 1;
        }
        if (l[i][j] > z) {
          z = l[i][j];
          ret = [s.substring(i - z, i)];
        } else if (l[i][j] == z) {
          ret.add(s.substring(i - z, i));
        }
      } else {
        l[i][j] = 0;
      }
    }
  }
  return ret.singleOrNull ?? '';
}

Uint8List fromIntList(List<int> list) {
  return getData(list).listData;
}

Widget errorBuilder(BuildContext context, Object object, StackTrace? trace) {
  object.jot();
  trace.jot();
  return Icons.error.iconBuilder(
      size: context.height / 16,
      color: context.themeMaterial.secondaryHeaderColor);
}

Widget getImageLoader(BuildContext context, Widget child, int? i, bool flag) {
  i.jot();
  flag.jot();
  return child;
}

Widget getErrorWidget(BuildContext context, Object object, StackTrace? trace) {
  object.jot();
  trace.jot();
  return object.string.textWidget();
}

String? validateName(String? name) =>
    (name?.isEmpty ?? true) ? 'Enter a valid Name' : null;

String? validatePassword(String? password) {
  return password != null && password.isValidPassword
      ? null
      : 'Please enter valid password';
}

String? validateEmail(String? email) {
  return email != null && email.isValidEmail
      ? null
      : 'Please enter a valid Email';
}

Future<Uint8List> getBytesFromAsset(String path,
    {int? width, int? height}) async {
  final data = await rootBundle.load(path);
  final codec = await instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width, targetHeight: height);
  final fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ImageByteFormat.png))!
      .buffer
      .asUint8List();
}
