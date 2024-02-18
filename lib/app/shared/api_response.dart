enum ApiResponseStatus {
  error,
  success,
}

class ApiResponse<T> {
  String message;
  ApiResponseStatus status;
  T? data;

  ApiResponse({
    required this.message,
    required this.status,
    this.data,
  });

  factory ApiResponse.error(
    String message, {
    T? data,
  }) {
    return ApiResponse(
      message: message,
      status: ApiResponseStatus.error,
      data: data,
    );
  }

  factory ApiResponse.success(
    String message, {
    T? data,
  }) {
    return ApiResponse(
      message: message,
      status: ApiResponseStatus.success,
      data: data,
    );
  }

  @override
  bool operator ==(covariant ApiResponse other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.data == data;
  }

  @override
  int get hashCode => message.hashCode ^ status.hashCode ^ data.hashCode;

  @override
  String toString() =>
      'ApiResponse(message: $message, status: $status, data: $data)';
}
