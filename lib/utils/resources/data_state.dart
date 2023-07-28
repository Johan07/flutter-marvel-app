import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T data;
  final DioException error;

  const DataState({required this.data, required this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({required super.data, required super.error});
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({required super.data, required super.error});
}
