import 'package:student_lecture_app/infrastructure/common/dtos/api_response_model.dart';

class ApiResponseException implements Exception {
  final ApiResponseModel model;
  final String message;

  ApiResponseException(this.message, this.model);
  @override
  String toString() => "$message ${model.errorMsg}";
}

class PreConditionedException extends ApiResponseException {
  PreConditionedException(ApiResponseModel model) : super("Error: ", model);
  @override
  String toString() => model.errorMsg;
}

class DefaultException implements Exception {
  final String? _message;

  DefaultException(this._message);
  @override
  String toString() => _message ?? "No internet connection";
}

class NoInternetException extends DefaultException {
  NoInternetException() : super('No internet connection');
}

class UnknownException extends DefaultException {
  UnknownException(e) : super(e != null ? e.toString() : 'Unknown error, please report this to us');
}

class TimeoutException extends DefaultException {
  TimeoutException() : super('Problem with connection timeout, please try again');
}

class ApiResponseNotValidException extends DefaultException {
  ApiResponseNotValidException() : super('Server error, please report this to us');
}
