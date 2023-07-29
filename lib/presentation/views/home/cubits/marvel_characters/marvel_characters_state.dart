part of 'marvel_characters_cubit.dart';

@immutable
abstract class MarvelCharactersState {
  const MarvelCharactersState();
}

class MarvelCharactersLoading extends MarvelCharactersState {
  const MarvelCharactersLoading();
}

class MarvelCharactersSuccess extends MarvelCharactersState {
  final List<Character> characters;
  final List<Character> filteredCharacters;
  const MarvelCharactersSuccess({
    this.characters = const [],
    this.filteredCharacters = const [],
  });
}

class MarvelCharactersFailed extends MarvelCharactersState {
  final DioException? error;

  const MarvelCharactersFailed({
    this.error,
  });
}

class MarvelCharacterDetailSuccess extends MarvelCharactersState {
  final Character character;
  const MarvelCharacterDetailSuccess({required this.character});
}

class MarvelCharacterDetailFailed extends MarvelCharactersState {
  final Exception? error;
  const MarvelCharacterDetailFailed({
    this.error,
  });
}
