part of 'marvel_characters_cubit.dart';

@immutable
abstract class MarvelCharactersState {
  final List<Character> characters;
  final List<Character> filteredCharacters;
  final DioException? error;

  const MarvelCharactersState({
    this.characters = const [],
    this.filteredCharacters = const [],
    this.error,
  });
}

class MarvelCharactersLoading extends MarvelCharactersState {
  const MarvelCharactersLoading();
}

class MarvelCharactersSuccess extends MarvelCharactersState {
  const MarvelCharactersSuccess({super.characters, super.filteredCharacters});
}

class MarvelCharactersFailed extends MarvelCharactersState {
  const MarvelCharactersFailed({super.error});
}
