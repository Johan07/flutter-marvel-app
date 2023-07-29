// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../../../domain/models/character.dart';
import '../../../../cubits/base/base_cubit.dart';

part 'character_detail_state.dart';

class CharacterDetailCubit
    extends BaseCubit<CharacterDetailCubitState, List<Character>> {
  final List<Character> allCharacters;

  CharacterDetailCubit(this.allCharacters)
      : super(CharacterDetailLoading(), allCharacters);

  Future<void> loadCharacterDetail(String characterId) async {
    if (isBusy) return;
    await run(() async {
      final character = data.cast<Character?>().firstWhere(
            (character) => character?.id.toString() == characterId,
            orElse: () => null,
          );
      if (character == null) {
        emit(CharacterDetailFailed(error: Exception('Detail not found')));
      } else {
        emit(CharacterDetailSuccess(character: character));
      }
    });
  }
}
