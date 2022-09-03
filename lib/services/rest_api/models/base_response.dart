import 'dart:convert';

class BaseResponse<T> {
  final bool success;
  final String? message;
  final T? data;

  const BaseResponse(
    this.success,
    this.message,
    this.data,
  );

  factory BaseResponse.success(T data) {
    return BaseResponse(true, null, data);
  }

  factory BaseResponse.error(dynamic error) {
    return BaseResponse(false, error.toString(), null);
  }

  factory BaseResponse.fromMap(
    Map<String, dynamic> source, {
    String dataKey = 'data',
    String errorKey = 'message',
  }) {
    return BaseResponse(
      source['success'],
      source[errorKey],
      source[dataKey],
    );
  }

  factory BaseResponse.fromJson(
    String json, {
    String dataKey = 'data',
    String errorKey = 'message',
  }) {
    return BaseResponse.fromMap(
      jsonDecode(json),
      errorKey: errorKey,
      dataKey: dataKey,
    );
  }

  BaseResponse<T> copyWith(T newData) {
    return BaseResponse<T>(
      success,
      message,
      newData,
    );
  }
}
