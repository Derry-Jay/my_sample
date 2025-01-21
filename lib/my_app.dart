import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

import '/extensions/extensions.dart';
import 'utils/values.dart';
import 'views/screens/common/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget rootBuilder(BuildContext context, Widget? child) {
    context.initScreenUtil(minTextAdapt: true, designSize: minDesignSize);
    return AppRoot(
        home: child,
        navigatorKey: navKey,
        themeMaterial: css.theme,
        themeApple: css.appleTheme,
        onGenerateRoute: rg.generateRoute,
        title: 'name'.valFromConfig<String>());
  }

  @override
  Widget build(BuildContext context) => adaptiveScreen(
      minTextAdapt: true,
      builder: rootBuilder,
      lowestSize: minDesignSize,
      child: const SplashScreen());
}
