import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/data/datasources/remote/marvel_api_service.dart';
import 'package:marvel_app/data/datasources/remote/marvel_api_service_impl.dart';
import 'package:marvel_app/data/repositories/api_repository_impl.dart';
import 'package:marvel_app/domain/models/requests/marvel_characters_request.dart';
import 'package:marvel_app/domain/models/responses/marvel_characters_response.dart';
import 'package:marvel_app/utils/resources/data_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'api_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MarvelApiServiceImpl>()])
void main() {
  late ApiRepositoryImpl apiRepository;
  late MarvelApiService mockMarvelApiService;

  setUp(() {
    mockMarvelApiService = MockMarvelApiServiceImpl();
    apiRepository = ApiRepositoryImpl(mockMarvelApiService);
  });
  group('ApiRepositoryImpl', () {
    test('DataSuccess with MarvelCharactersResponse', () async {
      final successfulResponseData = fixture('marvel_characters.json');
      final successfulResponse = Response<MarvelCharactersResponse>(
        data: MarvelCharactersResponse.fromJson(
          jsonDecode(
            successfulResponseData,
          ),
        ),
        statusCode: HttpStatus.ok,
        requestOptions: RequestOptions(path: ''),
      );

      when(
        (mockMarvelApiService as MockMarvelApiServiceImpl)
            .getMarvelCharacters(any),
      ).thenAnswer(
        (_) async => successfulResponse,
      );

      final result = await apiRepository.getMarvelCharacters(
        request: MarvelCharactersRequest(),
      );

      expect(result, isA<DataSuccess<MarvelCharactersResponse?>>());
      expect(result.error, isNull);
    });

    test('DataFailed with DioException', () async {
      final errorMessage = {
        "code": "InvalidCredentials",
        "message": "The passed API key is invalid."
      };

      when(
        (mockMarvelApiService as MockMarvelApiServiceImpl)
            .getMarvelCharacters(any),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            statusCode: HttpStatus.unauthorized,
            data: errorMessage,
            requestOptions: RequestOptions(),
          ),
        ),
      );

      final result = await apiRepository.getMarvelCharacters(
        request: MarvelCharactersRequest(),
      );

      expect(result, isA<DataFailed<MarvelCharactersResponse?>>());
      expect(result.data, isNull);
      expect(result.error, isNotNull);
    });
  });
}
