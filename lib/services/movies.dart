import 'package:flutter_tutorial/models/movie.dart';
import 'package:flutter_tutorial/widget/movie_card.dart';

import 'networking.dart';

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
  }

  Future<List<MovieCard>> getMovies({required String moviesType}) async {
    List<MovieCard> temp = [];
    // String mTypString =
    //     moviesType.toString().substring(14, moviesType.toString().length);
    var data = await _fetchMovie(
        url:
            'https://api.themoviedb.org/3/movie/$moviesType?api_key=d3150e83a35a557026d9e1bc83a4fbc5');
    for (var item in data["results"]) {
      temp.add(
        MovieCard(
          movieModel2: MovieModel2(
            title: item["title"],
            imageUrl: "https://image.tmdb.org/t/p/w300${item["poster_path"]}",
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
}