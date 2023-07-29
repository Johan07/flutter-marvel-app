import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/models/character.dart';

class CharacterBoxWidget extends StatelessWidget {
  const CharacterBoxWidget({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/details/${character.id}');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
            )
          ],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              '${character.thumbnail?.path ?? ''}.${character.thumbnail?.extension}',
            ),
          ),
        ),
        alignment: Alignment.bottomLeft,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          width: double.infinity,
          padding: EdgeInsets.all(8),
          child: Text(
            character.name ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
