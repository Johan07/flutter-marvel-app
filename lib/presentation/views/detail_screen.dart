import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marvel_app/presentation/cubits/marvel_characters/marvel_characters_cubit.dart';

class DetailScreen extends StatelessWidget {
  final String characterId;
  const DetailScreen({Key? key, required this.characterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarvelCharactersCubit, MarvelCharactersState>(
      builder: (context, state) {
        final character =
            context.read<MarvelCharactersCubit>().getCharacterById(characterId);
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
              character?.name ?? '',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
