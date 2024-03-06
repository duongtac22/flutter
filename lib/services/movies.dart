import 'dart:async';
import 'dart:developer';

import 'package:flutter_tutorial/common/settings.dart';
import 'package:flutter_tutorial/models/movie.dart';
import 'package:flutter_tutorial/services/networking.dart';
import 'package:flutter_tutorial/widget/movie_card.dart';

enum MovieParams {
  popular,
  upcoming,
  // top_rated,
}

class MovieModels {
  Future _fetchMovie({required String url}) async {
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(url));
    var data = await networkHelper.getData();
    return data;
    // final response = await http.get(Uri.parse('url'));

    // if (response.statusCode == 200) {
    //   // If the server did return a 200 OK response,
    //   // then parse the JSON.
    //   return MovieModel2.fromJson(
    //       jsonDecode(response.body) as Map<String, dynamic>);
    // } else {
    //   // If the server did not return a 200 OK response,
    //   // then throw an exception.
    //   throw Exception('Failed to load album');
    // }
  }

  Future<List<MovieCard>> getMovies({required moviesType}) async {
    log('loadData : $moviesType');
    List<MovieCard> temp = [];
    // String mTypString =
    //     moviesType.toString().substring(14, moviesType.toString().length);
    var data = await _fetchMovie(
        url: 'https://api.themoviedb.org/3/movie/$moviesType?api_key=$apiKey');

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
    // log temp to see the data structure

    return Future.value(temp);
  }

  Future<MovieDetail> getMovieDetail({required String movieId}) async {
    var data = await _fetchMovie(
        url: 'https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey');
    log(data);
    return MovieDetail(
        backgroundURL: 'aaaaa', title: 'title', overview: 'overview');
    // return Future.value(MovieDetail(
    //     backgroundURL: data["backdrop_path"],
    //     title: data["title"],
    //     overview: data["overview"]));
  }
}
