import 'package:dio/dio.dart';
import '../../../../../domain/models/character.dart';
import '../../../../../domain/models/requests/marvel_characters_request.dart';
import '../../../../../domain/models/responses/marvel_characters_response.dart';
import '../../../../../domain/repositories/api_repository.dart';
import '../../../../cubits/base/base_cubit.dart';
import '../../../../../utils/resources/data_state.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'marvel_characters_state.dart';

class MarvelCharactersCubit
    extends BaseCubit<MarvelCharactersState, List<Character>> {
  final ApiRepository _apiRepository;

  MarvelCharactersCubit(this._apiRepository)
      : super(MarvelCharactersLoading(), []);

  List<Character> get allCharacters => data;

  Future<void> getMarvelCharacters() async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.getMarvelCharacters(
        request: MarvelCharactersRequest(),
      );
      if (response is DataSuccess<MarvelCharactersResponse>) {
        List<Character> characters = response.data!.data!.results ?? [];
        data.addAll(characters);
        emit(MarvelCharactersSuccess(characters: data));
      } else if (response is DataFailed) {
        emit(MarvelCharactersFailed(error: response.error));
      }
    });
  }

  Future<void> filterCharacters(String searchText) async {
    if (isBusy) return;
    await run(() async {
      if (state is! MarvelCharactersSuccess) return;
      final successState = state as MarvelCharactersSuccess;
      final filteredList = successState.characters.where((character) {
        if (character.name == null) return false;
        return character.name!.toLowerCase().contains(searchText.toLowerCase());
      }).toList();

      emit(MarvelCharactersSuccess(
        characters: data,
        filteredCharacters: filteredList,
      ));
    });
  }
}
