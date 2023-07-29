import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:marvel_app/domain/models/character.dart';

import '../cubits/marvel_characters/marvel_characters_cubit.dart';

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
        title: Text('Marvel Characters'),
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
              return CharactersScrollView(
                characters: state.characters,
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

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
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Text(characters[index].name ?? '?'),
            childCount: characters.length,
          ),
        )
      ],
    );
  }
}
