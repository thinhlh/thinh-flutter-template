class ResponseModel<T> {
  final bool success;
  final String? message;
  final T data;

  const ResponseModel._internal(this.success, this.message, this.data);

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel._internal(
      json['success'],
      json['message'],
      json['data'],
    );
  }
}
