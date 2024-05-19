import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:student_lecture_app/core/commons/constants.dart';
import 'package:student_lecture_app/infrastructure/common/dtos/api_response_model.dart';
import 'package:student_lecture_app/infrastructure/core/api_configuration.dart';
import 'package:student_lecture_app/infrastructure/core/exceptions.dart';

@LazySingleton()
class ApiHelper {
  final Dio _dio;
  ApiHelper(
    this._dio,
  );
  Future<ApiResponseModel> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Map<String, dynamic> queries = {
        "api-key": Constants.apiKey,
      };

      if (queryParameters != null) {
        queries.addAll(queryParameters);
      }

      final Response response = await _dio.get(
        path,
        queryParameters: queries,
        options: options,
      );
      return ApiConfiguration.handleApiResponse(response);
    } on SocketException {
      return Future.error(NoInternetException());
    } on DioException catch (e) {
      return ApiConfiguration.handleDioErrorResponse(e);
    } catch (e) {
      return Future.error(UnknownException(e));
    }
  }
}
