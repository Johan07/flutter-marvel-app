import '../datasources/remote/marvel_api_service.dart';

import 'base/base_api_repository.dart';
import '../../domain/models/requests/marvel_characters_request.dart';
import '../../domain/models/responses/marvel_characters_response.dart';
import '../../domain/repositories/api_repository.dart';
import '../../utils/resources/data_state.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final MarvelApiService _marvelApiService;

  ApiRepositoryImpl(this._marvelApiService);

  @override
  Future<DataState<MarvelCharactersResponse?>> getMarvelCharacters({
    required MarvelCharactersRequest request,
  }) {
    return getStateOf<MarvelCharactersResponse>(request: () {
      return _marvelApiService.getMarvelCharacters(request);
    });
  }
}
