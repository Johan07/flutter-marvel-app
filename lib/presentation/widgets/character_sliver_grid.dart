import 'package:flutter/material.dart';

import '../../domain/models/character.dart';
import 'character_box_widget.dart';

class CharacterSliverGrid extends StatelessWidget {
  const CharacterSliverGrid({
    super.key,
    required this.characters,
  });

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 500 ? 4 : 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
        crossAxisSpacing: 7,
      ),
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          return CharacterBoxWidget(
            character: characters[index],
          );
        },
        childCount: characters.length,
      ),
    );
  }
}
