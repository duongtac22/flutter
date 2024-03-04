import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widget/movie_card.dart';

class MovieCardContainer extends StatelessWidget {
  final List<MovieCard> movieCards;

  const MovieCardContainer({
    required this.movieCards,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: movieCards.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            mainAxisExtent: 220.0),
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(movieModel2: movieCards[index].movieModel2);
        });
  }
}
