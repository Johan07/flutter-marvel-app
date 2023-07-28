import 'package:dio/dio.dart';

import '../../../domain/models/requests/marvel_characters_request.dart';
import '../../../domain/models/responses/marvel_characters_response.dart';

abstract class MarvelApiService {
  Future<Response<MarvelCharactersResponse>> getMarvelCharacters(
    MarvelCharactersRequest request,
  );
}
