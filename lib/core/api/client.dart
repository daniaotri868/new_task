import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'client_config.dart';
import 'exceptions.dart';

typedef HttpLibraryMethodInvocation<T> = Future<Response<T>> Function();

@injectable
class ClientApi {
  final Dio _client;

  ClientApi(this._client);

  Future<Response<T>> request<T>(
    RequestConfig<T> settings, {
    final ProgressCallback? onReceiveProgress,
    final ProgressCallback? onSendProgress,
  }) async {
    Response<T> response;
    final queryParameters = settings.queryParameters;
    final data = settings.data;
    final endpoint = settings.endpoint;

    final baseUrl = Uri.parse(_client.options.baseUrl);

    final requestUrl = Uri(
      path: baseUrl.path + endpoint,
      queryParameters: queryParameters,
      host: baseUrl.host,
      scheme: baseUrl.scheme,
      port: baseUrl.port,
    );
    switch (settings.clientMethod) {
      case ClientMethod.get:
        function() => _client.getUri<T>(
              requestUrl,
              onReceiveProgress: onReceiveProgress,
              data: data,
            );

        response = await _mapException<T>(function);
        break;
      case ClientMethod.post:
        function() => _client.postUri<T>(
              requestUrl,
              onReceiveProgress: onReceiveProgress,
              onSendProgress: onSendProgress,
              data: data,
            );

        response = await _mapException<T>(function);
        break;
      case ClientMethod.put:
        function() => _client.putUri<T>(
              requestUrl,
              onReceiveProgress: onReceiveProgress,
              onSendProgress: onSendProgress,
              data: data,
            );
        response = await _mapException(function);
        break;
      case ClientMethod.delete:
        function() => _client.deleteUri<T>(requestUrl, data: data);
        response = await _mapException(function);
        break;
    }

    return response;
  }

  Future<Response<T>> _mapException<T>(
        HttpLibraryMethodInvocation<T> method) async {
    try {
      return await method();
    } on DioException catch (exception) {
      if (exception.response?.statusCode.toString().matchAsPrefix('5') !=
          null) {
        throw AppNetworkException(
            reason: AppNetworkExceptionReason.serverError,
            exception: exception);
      }
      switch (exception.type) {
        case DioExceptionType.cancel:
          throw AppNetworkException(
            reason: AppNetworkExceptionReason.canceled,
            exception: exception,
          );
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          throw AppNetworkException(
              reason: AppNetworkExceptionReason.timedOut, exception: exception);
        case DioExceptionType.badResponse:
          // For DioErrorType.response, we are guaranteed to have a
          // response object present on the exception.
          final response = exception.response;
          if (response == null || response is! Response<T>) {
            // This should never happen, judging by the current source code
            // for Dio.
            throw AppNetworkResponseException(exception: exception);
          }

          throw AppNetworkResponseException(
            exception: exception,
            message: response.data is Map
                ? ((response.data as Map?)?['errorMessage'] ?? "")
                : "",
            statusCode: response.statusCode,
            data: response.data,
          );
        case DioExceptionType.unknown:
        default:
          if (exception.error is SocketException) {
            throw AppNetworkException(
                reason: AppNetworkExceptionReason.noInternet,
                exception: exception);
          }
          throw AppException.unknown(
              exception: exception,
              message: exception.response?.data['errorMessage']);
      }
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw AppException.unknown(
        exception: e is Exception ? e : Exception('Unknown exception occurred'),
        message: "UnKnow Error!",
      );
    }
  }
}
