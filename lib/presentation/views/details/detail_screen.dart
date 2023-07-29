import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../home/cubits/marvel_characters/marvel_characters_cubit.dart';
import 'cubits/character_detail/character_detail_cubit.dart';
import 'widgets/character_detail_scroll_view.dart';

class DetailScreen extends HookWidget {
  final String characterId;
  const DetailScreen({Key? key, required this.characterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final marvelCharactersCubit = BlocProvider.of<MarvelCharactersCubit>(
      context,
    );
    final characterDetailCubit = CharacterDetailCubit(
      marvelCharactersCubit.allCharacters,
    );

    useEffect(() {
      characterDetailCubit.loadCharacterDetail(characterId);
      return null;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.go('/'),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'About character',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<CharacterDetailCubit, CharacterDetailCubitState>(
        bloc: characterDetailCubit,
        builder: (context, state) {
          if (state is CharacterDetailSuccess) {
            return CharacterDetailScrollView(character: state.character);
          }
          if (state is CharacterDetailFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        },
      ),
    );
  }
}
