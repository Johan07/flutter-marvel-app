import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/data/datasources/remote/marvel_api_service_impl.dart';
import 'package:marvel_app/domain/models/requests/marvel_characters_request.dart';
import 'package:marvel_app/domain/models/responses/marvel_characters_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'marvel_api_service_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  group('MarvelApiServiceImpl', () {
    late MarvelApiServiceImpl marvelApiService;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      marvelApiService = MarvelApiServiceImpl(mockDio);
    });

    test('test_marvel_api_service_get_marvel_characters_returns_marvel_characters_response', () async {
      final successfulResponseData = fixture('marvel_characters.json');
      final successfulResponse = Response(
        requestOptions: RequestOptions(),
        data: jsonDecode(successfulResponseData),
        statusCode: 200,
      );

      when(mockDio.get(
        any,
        options: anyNamed('options'),
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => successfulResponse);

      final response = await marvelApiService.getMarvelCharacters(
        MarvelCharactersRequest(),
      );

      expect(response.statusCode, 200);
      expect(response.data!, isA<MarvelCharactersResponse>());
    });

    test('test_marvel_api_service_get_marvel_characters_throws_dio_exception', () async {
      final errorException = DioException(requestOptions: RequestOptions());
      when(
        mockDio.get(
          any,
          options: anyNamed('options'),
          queryParameters: anyNamed('queryParameters'),
        ),
      ).thenThrow(errorException);

      expect(
        () async => await marvelApiService.getMarvelCharacters(
          MarvelCharactersRequest(),
        ),
        throwsA(isA<DioException>()),
      );
    });
  });
}
