import 'dart:convert';

import 'package:apollo_mobile/core/network/api_response.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  final Map<String, String> defaultHeaders;

  ApiClient({
    required this.baseUrl,
    this.defaultHeaders = const {'Content-Type': 'application/json'},
  });

  Future<ApiResponse<T>> get<T>(
    String endpoint,
    T Function(dynamic json)? fromJsonT,
    Map<String, String> headers,
    bool withAuth,
  ) async {
    final uri = Uri.parse("$baseUrl$endpoint");
    final response = await http.get(
      uri,
      headers: _buildHeaders(headers, withAuth),
    );

    return _processResponse(response, fromJsonT);
  }

  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    Object? body,
    T Function(dynamic json)? fromJsonT,
    Map<String, String>? headers,
    bool withAuth = true,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await http.post(
      uri,
      headers: _buildHeaders(headers, withAuth),
      body: body != null ? jsonEncode(body) : null,
    );

    return _processResponse(response, fromJsonT);
  }

  Map<String, String> _buildHeaders(
    Map<String, String>? customHeaders,
    bool withAuth,
  ) {
    return {...defaultHeaders, if (customHeaders != null) ...customHeaders};
  }

  ApiResponse<T> _processResponse<T>(
    http.Response response,
    T Function(dynamic json)? fromJsonT,
  ) {
    final jsonBody = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return ApiResponse<T>.fromJson(jsonBody, fromJsonT);
    } else {
      return ApiResponse<T>(
        success: false,
        message: jsonBody['message'] ?? 'Unknown error',
        data: null,
        error: jsonBody['error'] ?? 'Error',
      );
    }
  }
}
