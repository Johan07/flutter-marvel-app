part of 'marvel_characters_cubit.dart';

@immutable
abstract class MarvelCharactersState {
  final List<Character> characters;
  final bool noMoreData;
  final DioException? error;

  const MarvelCharactersState({
    this.characters = const [],
    this.noMoreData = true,
    this.error,
  });
}

class MarvelCharactersLoading extends MarvelCharactersState {
  const MarvelCharactersLoading();
}

class MarvelCharactersSuccess extends MarvelCharactersState {
  const MarvelCharactersSuccess({super.characters, super.noMoreData});
}

class MarvelCharactersFailed extends MarvelCharactersState {
  const MarvelCharactersFailed({super.error});
}
