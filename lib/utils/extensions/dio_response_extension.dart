import 'package:dio/dio.dart';

extension ResponseCopy on Response {
  Response<T> changeData<T>(T data) {
    return Response<T>(
    data: data,
    requestOptions: requestOptions,
    statusCode: statusCode,
    statusMessage: statusMessage,
    isRedirect: isRedirect,
    redirects: redirects,
    extra: extra,
    headers: headers,
  );
  }
}
