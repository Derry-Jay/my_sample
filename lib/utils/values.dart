import 'package:common_utils/common_utils.dart';

import '../css/css.dart';
import '../css/measurements.dart';
import '../css/shades.dart';
import '../extensions/extensions.dart';
import 'methods.dart';
import 'route_generator.dart';

int page = 0;

bool hideText = true;

DateTime? currentBackPressTime;

Map<String, dynamic> body = <String, dynamic>{};

final css = Css(),
    shades = Shades(),
    spaceExp = r'\s'.getRE(),
    measurements = Measurements(),
    cm = obtainCommonState.state(),
    rg = RouteGenerator(flag: true),
    minPwdLth = 'minimum_password_length'.valFromConfig<String>()?.toInt() ?? 8,
    maxPwdLth =
        'maximum_password_length'.valFromConfig<String>()?.toInt() ?? 16,
    splashScreenDelay =
        'splash_screen_delay'.valFromConfig<String>()?.toInt() ?? 3,
    minDesignSize = <double>[
      'minimum_screen_width'.valFromConfig<String>()?.toDouble() ?? double.nan,
      'minimum_screen_height'.valFromConfig<String>()?.toDouble() ?? double.nan
    ].size;
