import 'package:dio/dio.dart';
import 'package:marvel_app/domain/models/requests/marvel_characters_request.dart';
import 'package:marvel_app/domain/models/responses/marvel_characters_response.dart';
import 'package:marvel_app/utils/constants/environment.dart';

abstract class MarvelApiService {
  final String baseUrl;
  MarvelApiService(Dio dio, {this.baseUrl = kBaseUrl});

  Future<Response<MarvelCharactersResponse>> getMarvelCharacters(
    MarvelCharactersRequest request,
  );
}
