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
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Wrap(spacing: 10, children: movieCards),
    );
  }
}
