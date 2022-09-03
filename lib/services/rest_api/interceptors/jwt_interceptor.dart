import 'package:dio/dio.dart';
import 'package:tfc/services/local/shared_preferences/app_preference.dart';
import 'package:tfc/services/local/shared_preferences/app_preference_keys.dart';
import 'package:tfc/utils/logger_utils.dart';

class JWTInterceptor extends Interceptor {
  final AppPreferences _store = AppPreferences.instance;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = _store.get<String>(AppPreferenceKey.accessToken);

    if (token == null) {
      // TODO no token found
      LoggerUtils.logger.d('No Token found');
    } else {
      options.headers.putIfAbsent('Authorization', () => token);
    }

    super.onRequest(options, handler);
  }
}
