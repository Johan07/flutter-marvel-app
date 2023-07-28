import '../models/requests/marvel_characters_request.dart';
import '../models/responses/marvel_characters_response.dart';
import '../../utils/resources/data_state.dart';

abstract class ApiRepository {
  Future<DataState<MarvelCharactersResponse>> getMarvelCharacters({
    required MarvelCharactersRequest request,
  });
}
