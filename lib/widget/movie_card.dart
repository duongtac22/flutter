import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/movie.dart';
import 'package:flutter_tutorial/screens/detail_movie.dart';

class MovieCard extends StatelessWidget {
  final MovieModel2 movieModel2;
  // const MovieCard({required this.movieModel2, super.key});
  const MovieCard({super.key, required this.movieModel2});

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
          child: SizedBox(
              // child: Column(
              //   children: [
              //     Expanded(
              //       flex: 1,
              //       child: ClipRRect(
              //         borderRadius: const BorderRadius.only(
              //             topLeft: Radius.circular(12),
              //             topRight: Radius.circular(12)),
              //         child: CachedNetworkImage(
              //           width: double.infinity,
              //           fit: BoxFit.fitWidth,
              //           placeholder: (context, url) => const Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [CircularProgressIndicator()],
              //           ),
              //           imageUrl: movieModel2.imageUrl,
              //           errorWidget: (context, url, error) => const Column(
              //             children: [CircularProgressIndicator()],
              //           ),
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: Padding(
              //         padding: const EdgeInsets.all(10),
              //         child: Text(
              //           movieModel2.title,
              //           maxLines: 1,
              //           overflow: TextOverflow.ellipsis,
              //           style: const TextStyle(
              //               fontSize: 18, fontWeight: FontWeight.w500),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
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
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        movieModel2.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),

              // Positioned(
              //   bottom: 10,
              //   left: 10,
              //   child: Text(
              //     movieModel2.title,
              //     maxLines: 1,
              //     overflow: TextOverflow.ellipsis,
              //     style: const TextStyle(
              //         fontSize: 18, fontWeight: FontWeight.w500),
              //   ),
              // )
            ],
          ))),
    );
  }
}
