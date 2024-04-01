import 'dart:async';

import 'package:tfc/services/rest_api/api/api_error_type.dart';
import 'package:tfc/services/rest_api/models/base_response.dart';

mixin ApiError {
  /// Call api safety with error handling.
  /// Required:
  /// - apiCaller: call service functions
  /// Optional:
  /// - onStart: the function executed before the handler, can be null
  /// - onCompleted: the function executed right after handler is executed, can be null
  /// - onSuccess: the function executed on handler completed with success, can be null
  /// - onError: the function executed in case handler return failed or crashed, can be null
  /// - onFinally: the function executed end of function, can be null
  /// - unauthorized: the function executed when apiCaller return with unauthorized error. Return false to by pass the global handler, can be null
  Future<void> apiCallSafety<T>(
    Future<BaseResponse<T>> Function() apiCaller, {
    Future<void> Function()? onStart,
    Future<void> Function()? onCompleted,
    Future<void> Function(T? res)? onSuccess,
    Future<void> Function(dynamic error)? onError,
    Future<void> Function()? onFinally,
    Future<bool> Function()? unauthorized,
  }) async {
    try {
      /// On start, use for show loading

      await onStart?.call();

      // await Future.delayed(Duration(milliseconds: 100));

      /// Execute api
      final result = await apiCaller();

      await onCompleted?.call();

      if (result.success) {
        /// On completed, use for hide loading
        await onSuccess?.call(result.data);
      } else {
        if (result.message == ApiErrorCode.unauthorized.name) {
          final forwardToAppUnAuthorized = await unauthorized?.call();

          // If not provider unauthorized function or forward is true
          if (unauthorized == null || forwardToAppUnAuthorized == true) {
            //
          }
        }
        await onError?.call(result.message);
      }
    } catch (error) {
      await onCompleted?.call();

      /// In case error:

      /// On inline error
      await onError?.call(error);

      return;
    } finally {
      /// Call finally function
      await onFinally?.call();
    }
  }
}
