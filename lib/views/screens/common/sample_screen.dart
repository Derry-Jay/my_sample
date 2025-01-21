import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

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
