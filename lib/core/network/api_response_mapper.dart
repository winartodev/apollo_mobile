import 'package:apollo_mobile/core/network/api_response.dart';

extension ApiResponseMapper<T> on ApiResponse<T> {
  R mapData<R>(R Function(T data) mapper) {
    if (!success || data == null) {
      throw Exception(message.isNotEmpty ? message : 'Data is null');
    }

    return mapper(data as T);
  }
}
