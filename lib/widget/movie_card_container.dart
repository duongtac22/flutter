import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widget/movie_card.dart';

class MovieCardContainer extends StatelessWidget {
  final List<MovieCard> movieCards;
  // final ScrollController scrollController;

  const MovieCardContainer({
    required this.movieCards,
    // required this.scrollController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: movieCards.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(movieModel2: movieCards[index].movieModel2);
        });
  }
}
