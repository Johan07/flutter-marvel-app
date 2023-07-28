import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel_app/data/datasources/remote/marvel_api_service.dart';
import 'package:marvel_app/data/datasources/remote/marvel_api_service_impl.dart';
import 'package:marvel_app/data/repositories/api_repository_impl.dart';
import 'package:marvel_app/domain/repositories/api_repository.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  final Dio dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<MarvelApiService>(MarvelApiServiceImpl(getIt<Dio>()));
  getIt.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(getIt<MarvelApiService>()),
  );
}
