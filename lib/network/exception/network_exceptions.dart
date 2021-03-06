import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest() = UnauthorisedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioErrorType.connectTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioErrorType.other:
              networkExceptions = const NetworkExceptions.noInternetConnection();
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.response:
              switch (error.response?.statusCode) {
                case 400:
                  networkExceptions = const NetworkExceptions.unauthorisedRequest();
                  break;
                case 401:
                  networkExceptions = const NetworkExceptions.unauthorisedRequest();
                  break;
                case 403:
                  networkExceptions = const NetworkExceptions.unauthorisedRequest();
                  break;
                case 404:
                  networkExceptions = const NetworkExceptions.notFound("Not found");
                  break;
                case 409:
                  networkExceptions = const NetworkExceptions.conflict();
                  break;
                case 408:
                  networkExceptions = const NetworkExceptions.requestTimeout();
                  break;
                case 500:
                  networkExceptions = const NetworkExceptions.internalServerError();
                  break;
                case 503:
                  networkExceptions = const NetworkExceptions.serviceUnavailable();
                  break;
                default:
                  var responseCode = error.response?.statusCode;
                  networkExceptions = NetworkExceptions.defaultError(
                    "Received invalid status code: $responseCode",
                  );
              }
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        // Helper.printError(e.toString());
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(notImplemented: () {
      errorMessage = 'error_not_implemented'.tr;
    }, requestCancelled: () {
      errorMessage = 'error_request_cancel'.tr;
    }, internalServerError: () {
      errorMessage = 'error_internal'.tr;
    }, notFound: (String reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = 'error_service_unavailable'.tr;
    }, methodNotAllowed: () {
      errorMessage = 'error_method_allowed'.tr;
    }, badRequest: () {
      errorMessage = 'error_bad_request'.tr;
    }, unauthorisedRequest: () {
      errorMessage = 'error_unauthorised_request'.tr;
    }, unexpectedError: () {
      errorMessage = 'error_unexpected'.tr;
    }, requestTimeout: () {
      errorMessage = 'error_request_timeout'.tr;
    }, noInternetConnection: () {
      errorMessage = 'error_no_internet'.tr;
    }, conflict: () {
      errorMessage = 'error_conflict'.tr;
    }, sendTimeout: () {
      errorMessage = 'error_api_connection_timeout'.tr;
    }, unableToProcess: () {
      errorMessage = 'error_process_data'.tr;
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = 'error_unexpected'.tr;
    }, notAcceptable: () {
      errorMessage = 'error_not_acceptable'.tr;
    });
    return errorMessage;
  }
}
