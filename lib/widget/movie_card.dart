import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/movie.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movieModel;
  const MovieCard({required this.movieModel, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: AssetImage(movieModel.poster),
                width: 150,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              movieModel.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
