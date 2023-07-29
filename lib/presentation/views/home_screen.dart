import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../domain/models/character.dart';
import '../cubits/marvel_characters/marvel_characters_cubit.dart';
import '../widgets/character_scroll_view.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final marvelCharactersCubit =
        BlocProvider.of<MarvelCharactersCubit>(context);

    useEffect(() {
      marvelCharactersCubit.getMarvelCharacters();
      return null;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Marvel Characters (Infinity war)',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<MarvelCharactersCubit, MarvelCharactersState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case MarvelCharactersLoading:
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            case MarvelCharactersFailed:
              print(state.error);
              return Center(
                child: IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    marvelCharactersCubit.getMarvelCharacters();
                  },
                ),
              );
            case MarvelCharactersSuccess:
              final List<Character> characters =
                  state.filteredCharacters.isNotEmpty
                      ? state.filteredCharacters
                      : state.characters;
              return CharactersScrollView(
                characters: characters,
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
