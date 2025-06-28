import 'dart:async';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:june/june.dart';

import '../extensions/extensions.dart';
import '../utils/keys.dart';
import '../utils/values.dart';

class CommonState extends JuneState with AnimationLocalStatusListenersMixin {
  static final CommonState _singleton = CommonState._internal();

  factory CommonState() => _singleton;

  CommonState._internal();

  bool? flag;

  int itemCount = 5, total = 0;

  String initScreen = 'sample';

  Animation<double>? animation;

  AnimationController? animationController;

  Stream<Progress> get progress => _progressCon.stream;

  final StreamController<Progress> _progressCon =
      StreamController<Progress>.broadcast();

  BuildContext? get bc =>
      navKey.currentContext ?? wb?.buildOwner?.focusManager.rootScope.context;

  void setItemCount(int ct) {
    itemCount = ct;
  }

  void nextScreen() {
    void gotoNextScreen(Duration timeStamp) async {
      await (timeStamp.inSeconds == splashScreenDelay
              ? timeStamp
              : Duration(seconds: splashScreenDelay))
          .delayedResult<void>(computation: _firstScreen);
    }

    wb?.addPostFrameCallback(gotoNextScreen);
  }

  void detectChange(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.completed:
      case AnimationStatus.dismissed:
        animationController?.dispose();
        break;
      default:
        doNothing();
        break;
    }
  }

  void goFrontIfMounted([double? from]) async {
    await animationController?.forward(from: from);
    // animationController?.notifyListeners();
    animationController?.notifyStatusListeners(AnimationStatus.forward);
  }

  void assignState(TickerProvider tp) {
    void setData(Duration duration) {
      animation =
          Tween<double>(begin: bc?.pixelRatio, end: 0).animate(
              tp
                  .getAnimationController(duration: duration)
                  .animationCurve(Curves.easeOut),
            )
            ..addListener(goFrontIfMounted)
            ..addStatusListener(detectChange);
    }

    wb?.addPostFrameCallback(setData);
  }

  void loaderDispose() {
    animationController?.dispose();
  }

  void onTextChanged(String? str) {
    total = str.sum;
    setState();
  }

  @override
  void didRegisterListener() {
    // TODO: implement didRegisterListener
    'object'.jot();
  }

  @override
  void didUnregisterListener() {
    // TODO: implement didUnregisterListener
    'object2'.jot();
  }

  FutureOr<Object?> _firstScreen() {
    return bc?.gotoForever('/$initScreen');
  }
}
