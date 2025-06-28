import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../extensions/extensions.dart';
import '../../../utils/methods.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget button = Icons.abc.iconBuilder().iconButtonBuilder();
    return ScreenLayout(
        bottomNavigationBar: button,
        navigationBar: CupertinoNavigationBar(
          trailing: button,
          middle: 'Menu'.toTextWidget(),
        ),
        appBar: AppBar(
          title: 'Menu'.toTextWidget(),
          // flexibleSpace: Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //         colors: [
          //           Color(gradient1),
          //           Color(gradient2),
          //         ],
          //         begin: const FractionalOffset(0.0, 0.0),
          //         end: const FractionalOffset(1.0, 0.0),
          //         stops: const [0.0, 1.0],
          //         tileMode: TileMode.clamp),
          //   ),
          // ),
        ),
        content: stateCommon.builderJune(numberBuilder));
  }
}
