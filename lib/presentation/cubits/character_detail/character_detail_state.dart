part of 'character_detail_cubit.dart';

@immutable
abstract class CharacterDetailCubitState {
  const CharacterDetailCubitState();
}

class CharacterDetailLoading extends CharacterDetailCubitState {
  const CharacterDetailLoading();
}

class CharacterDetailSuccess extends CharacterDetailCubitState {
  final Character character;
  const CharacterDetailSuccess({required this.character});
}

class CharacterDetailFailed extends CharacterDetailCubitState {
  final Exception? error;
  const CharacterDetailFailed({
    this.error,
  });
}
