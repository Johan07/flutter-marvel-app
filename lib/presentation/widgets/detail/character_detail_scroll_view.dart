import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/models/character.dart';

class CharacterDetailScrollView extends StatelessWidget {
  const CharacterDetailScrollView({
    super.key,
    required this.character,
  });

  final Character? character;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CharacterPictureSliver(character: character),
        CharacterDescriptionSliver(character: character),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20,
            ),
            child: Text(
              "Series",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        CharacterSeriesSliver(character: character)
      ],
    );
  }
}

class CharacterSeriesSliver extends StatelessWidget {
  const CharacterSeriesSliver({
    super.key,
    required this.character,
  });

  final Character? character;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.19,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.5,
            ),
            itemCount: character!.series!.items!.length,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  character!.series!.items![index].name ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CharacterDescriptionSliver extends StatelessWidget {
  const CharacterDescriptionSliver({
    super.key,
    required this.character,
  });

  final Character? character;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              character?.name ?? '',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              character?.description?.isEmpty ?? true
                  ? '[Description not available.]'
                  : character?.description ?? '',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          if (character?.urls != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 20,
              ),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: character!.urls!.map(
                      (url) {
                        return Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                launchUrl(Uri.parse(url.url!));
                              },
                              child: Text(
                                url.type!.toUpperCase(),
                              ),
                            ),
                            SizedBox(width: 20),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class CharacterPictureSliver extends StatelessWidget {
  const CharacterPictureSliver({
    super.key,
    required this.character,
  });

  final Character? character;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(8),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: MediaQuery.of(context).size.width > 500
              ? 500
              : MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
              )
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                "${character?.thumbnail?.path}.${character?.thumbnail?.extension}",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
