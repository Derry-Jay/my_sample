import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../utils/methods.dart';
import '../../../utils/values.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      appBar: AppBar(
        foregroundColor: rainbow.kWhite,
        backgroundColor: context.themeMaterial.primaryColor,
        title: 'Delimiter-Separated-Values Addition'.toTextWidget(
          style: 'roboto'.getStyleFromFont(fontSize: 20),
        ),
      ),
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: 'Root',
        middle: 'Sample'.toTextWidget(),
        trailing: 'Next'.toTextWidget(),
      ),
      content: PaddedSizedBox(
        width: context.nonNullSize.width,
        height: context.nonNullSize.height,
        padding: EdgeInsets.symmetric(horizontal: context.width / 16),
        child:
            <Widget>[
              CustomTextField(
                maxLines: 2,
                onChanged: cm.onTextChanged,
                material: css.textFieldDecor,
              ).wrapWithFlexible(),
              stateCommon.builderJune(sumBuilder).wrapWithFlexible(),
            ].placeWidgetsVertically(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
      ),
    ).wrapWithinSafeArea();
  }
}
