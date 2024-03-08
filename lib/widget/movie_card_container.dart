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
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            mainAxisExtent: 280.0),
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(movieModel2: movieCards[index].movieModel2);
        });
  }
}
