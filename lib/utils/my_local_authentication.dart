import 'package:local_auth/local_auth.dart';
import 'package:local_auth_platform_interface/types/auth_messages.dart';

import '../extensions/extensions.dart';
import 'values.dart';

class MyLocalAuthentication extends LocalAuthentication {
  static final MyLocalAuthentication _singleton =
      MyLocalAuthentication._internal();

  factory MyLocalAuthentication() => _singleton;

  MyLocalAuthentication._internal();

  Future<bool> confirm(String message,
          [AuthenticationOptions? options,
          Iterable<AuthMessages>? authMessages]) =>
      authenticate(
          localizedReason: message.trimmed,
          authMessages: authMessages ?? authMsgs,
          options: options ?? const AuthenticationOptions());
}
