import 'package:brainup/domain/error/error_entity.dart';

sealed class ApiError extends ErrorEntity {
  ApiError(super.originalException);
}

class HttpError extends ApiError {
  HttpError(super.originalException);
}

class ServerError extends ApiError {
  ServerError(super.originalException);
}

class NetworkError extends ApiError {
  NetworkError(super.originalException);
}

class UnexpectedError extends ApiError {
  UnexpectedError(super.originalException);
}
