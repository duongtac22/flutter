import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/detail_movie.dart';
import 'package:flutter_tutorial/widget/movie_card.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
    required this.temp,
    required this.size,
  });

  final List<MovieCard> temp;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: temp
            .map((e) => Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailMovieScreen(
                                    id: e.movieModel2.id,
                                    title: e.movieModel2.title,
                                  )));
                    },
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          width: size.width,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [CircularProgressIndicator()],
                          ),
                          imageUrl: e.movieModel2.imageUrl,
                          errorWidget: (context, url, error) => const Column(
                            children: [CircularProgressIndicator()],
                          ),
                        ),
                      ),
                    ),
                  );
                }))
            .toList(),
        options: CarouselOptions(
            autoPlay: true, enlargeCenterPage: true, height: size.height / 2));
  }
}
