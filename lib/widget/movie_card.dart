import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/movie.dart';
import 'package:flutter_tutorial/screen/detail_movie.dart';

class MovieCard extends StatelessWidget {
  final MovieModel2 movieModel2;
  const MovieCard({required this.movieModel2, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailMovieScreen(
                      id: movieModel2.id,
                      title: movieModel2.title,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: CachedNetworkImage(
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                ),
                imageUrl: movieModel2.imageUrl,
                errorWidget: (context, url, error) => const Column(
                  children: [CircularProgressIndicator()],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                movieModel2.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
