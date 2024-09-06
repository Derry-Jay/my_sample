import 'package:flutter/material.dart';
import '../../../extensions/extensions.dart';

import '../../widgets/common/screen_layout.dart';
import '../../widgets/common/themed_apple_app_bar.dart';
import '../../widgets/common/themed_material_app_bar.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ScreenLayout(
            content: 'pt'.textWidget(),
            appBar: const ThemedMaterialAppBar(),
            navigationBar: ThemedAppleAppBar(
              previousPageTitle: 'Root',
              middle: 'Sample'.textWidget(),
              trailing: 'Next'.textWidget(),
            )));
  }
}
