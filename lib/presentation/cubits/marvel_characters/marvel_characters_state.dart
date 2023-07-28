part of 'marvel_characters_cubit.dart';

@immutable
abstract class MarvelCharactersState {
  final List<Character> characters;
  final DioException? error;

  const MarvelCharactersState({
    this.characters = const [],
    this.error,
  });
}

class MarvelCharactersLoading extends MarvelCharactersState {
  const MarvelCharactersLoading();
}

class MarvelCharactersSuccess extends MarvelCharactersState {
  const MarvelCharactersSuccess({super.characters});
}

class MarvelCharactersFailed extends MarvelCharactersState {
  const MarvelCharactersFailed({super.error});
}
