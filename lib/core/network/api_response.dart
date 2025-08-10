class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;
  String? error;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
    this.error,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json)? fromJsonT,
  ) {
    return ApiResponse<T>(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: (json['data'] != null && fromJsonT != null)
          ? fromJsonT(json['data'])
          : json['data'] as T?,
      error: json['error'] as String?,
    );
  }

  @override
  String toString() {
    return 'ApiResponse{'
        'success: $success, '
        'message: "$message", '
        'data: ${data != null ? data.toString() : "null"}, '
        'error: ${error != null ? '"$error"' : "null"}'
        '}';
  }
}
