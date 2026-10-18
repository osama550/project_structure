class ErrorModel {
  final int? status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});

  /// Tolerant parsing: APIs differ in key casing and shape, and a malformed
  /// error body must never crash the error path.
  factory ErrorModel.fromJson(Map jsonData, {int? fallbackStatus}) {
    final message =
        jsonData['message'] ?? jsonData['Message'] ?? jsonData['error'];
    final status = jsonData['status'] ?? jsonData['statusCode'];
    return ErrorModel(
      errorMessage: message is String && message.isNotEmpty
          ? message
          : 'Unexpected error occurred',
      status: status is int ? status : fallbackStatus,
    );
  }
}
