import '../../utils/resources/data_state.dart';
import '../models/requests/marvel_characters_request.dart';
import '../models/responses/marvel_characters_response.dart';

abstract class ApiRepository {
  Future<DataState<MarvelCharactersResponse?>> getMarvelCharacters({
    required MarvelCharactersRequest request,
  });
}
