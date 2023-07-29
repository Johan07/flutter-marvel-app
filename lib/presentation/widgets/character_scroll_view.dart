import 'package:flutter/material.dart';
import 'package:marvel_app/domain/models/character.dart';
import 'package:marvel_app/presentation/widgets/search_character_field.dart';

import 'character_sliver_grid.dart';

class CharactersScrollView extends StatelessWidget {
  final List<Character> characters;

  const CharactersScrollView({
    super.key,
    required this.characters,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SearchCharacterField(),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: CharacterSliverGrid(characters: characters),
        ),
      ],
    );
  }
}
