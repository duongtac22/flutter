import 'package:flutter_tutorial/models/movie.dart';
import 'package:flutter_tutorial/widget/movie_card.dart';

import 'networking.dart';

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

  Future<List<MovieCard>> getMovies({required MovieParams moviesType}) async {
    List<MovieCard> temp = [];
    String mTypString =
        moviesType.toString().substring(14, moviesType.toString().length);
    var data = await _fetchMovie(
        url:
            'https://api.themoviedb.org/3/movie/$mTypString?api_key=d3150e83a35a557026d9e1bc83a4fbc5');
    for (var item in data["results"]) {
      temp.add(
        MovieCard(
          movieModel: MovieModel(
            title: item["title"],
            poster: "https://api.themoviedb.org/3/movie/${item["poster_path"]}",
            desciption: item["overview"],
            duration: item["release_date"],
            actors: item["title"],
          ),
        ),
      );
    }
    return Future.value(temp);
  }
}
