import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/presentation/cubits/marvel_characters/marvel_characters_cubit.dart';

class SearchCharacterField extends StatelessWidget {
  const SearchCharacterField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search character",
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onChanged: (text) {
          context.read<MarvelCharactersCubit>().filterCharacters(text);
        },
      ),
    );
  }
}
