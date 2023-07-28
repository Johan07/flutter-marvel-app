import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../utils/resources/data_state.dart';

abstract class BaseApiRepository {
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<Response<T>> Function() request,
  }) async {
    try {
      final Response<T> response = await request();
      if (response.statusCode == HttpStatus.ok) {
        return DataSuccess(data: response.data);
      } else {
        throw DioException(
          response: response,
          requestOptions: response.requestOptions,
        );
      }
    } on DioException catch (e) {
      return DataFailed(error: e);
    }
  }
}
