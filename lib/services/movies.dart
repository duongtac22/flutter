import 'dart:async';
import 'dart:developer';

import 'package:flutter_tutorial/common/settings.dart';
import 'package:flutter_tutorial/models/movie.dart';
import 'package:flutter_tutorial/services/networking.dart';
import 'package:flutter_tutorial/widget/movie_card.dart';

enum MovieParams {
  popular,
  upcoming,
  top_rated,
}

class MovieModels {
  Future _fetchMovie({required String url}) async {
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(url));
    var data = await networkHelper.getData();
    return data;
  }

  Future<List<MovieCard>> getMovies({required moviesType, page = 1}) async {
    List<MovieCard> temp = [];
    var data = await _fetchMovie(
        url:
            'https://api.themoviedb.org/3/movie/$moviesType?api_key=$apiKey&page=$page');
    log('data ${data.runtimeType}');
    for (var item in data["results"]) {
      temp.add(
        MovieCard(
          movieModel2: MovieModel2(
            title: item["title"],
            imageUrl: "https://image.tmdb.org/t/p/w500${item["poster_path"]}",
            overview: item["overview"],
            year: (item["release_date"].toString().length > 4)
                ? item["release_date"].toString().substring(0, 4)
                : "",
            id: item["id"].toString(),
            rating: item["vote_average"].toDouble(),
          ),
        ),
      );
    }

    return Future.value(temp);
  }

  Future<List<MovieCard>> searchMovies({required searchName}) async {
    log('loadData : $searchName');
    List<MovieCard> temp = [];
    var data = await _fetchMovie(
        url:
            '$apiSearchMovie?api_key=$apiKey&language=en-US&page=1&include_adult=false&query=$searchName');

    for (var item in data["results"]) {
      temp.add(
        MovieCard(
          movieModel2: MovieModel2(
            title: item["title"],
            imageUrl: "$apiImageURL${item["poster_path"]}",
            overview: item["overview"],
            year: (item["release_date"].toString().length > 4)
                ? item["release_date"].toString().substring(0, 4)
                : "",
            id: item["id"].toString(),
            rating: item["vote_average"].toDouble(),
          ),
        ),
      );
    }

    return Future.value(temp);
  }

  Future<MovieDetail> getMovieDetail({required String movieId}) async {
    var data = await _fetchMovie(
        url: 'https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey');
    // log(data);
    // return MovieDetail(
    //     backgroundURL: 'aaaaa', title: 'title', overview: 'overview');
    return Future.value(MovieDetail(
        backgroundURL: data["poster_path"],
        title: data["title"],
        overview: data["overview"]));
  }

  Future<List<MovieGenre>> getMovieGenre({required String url}) async {
    List<MovieGenre> temp = [];

    var data = await _fetchMovie(url: url);

    for (var item in data["genres"]) {
      temp.add(
        MovieGenre(
          id: item["id"].toString(),
          name: item["name"],
        ),
      );
    }

    return Future.value(temp);
  }
}
