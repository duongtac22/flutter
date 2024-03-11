class MovieModel {
  final String title;
  final String poster;
  final String desciption;
  final String duration;
  final String actors;
  MovieModel(
      {required this.title,
      required this.poster,
      required this.desciption,
      required this.duration,
      required this.actors});
}

class MovieModel2 {
  final String id;
  final String title;
  final String imageUrl;
  final String year;
  final double rating;
  String overview;

  MovieModel2({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.year,
    required this.overview,
    required this.rating,
  });
}

class MovieDetailParams {
  final String id;
  final String title;
  const MovieDetailParams(this.id, this.title);
}

class MovieDetail {
  final String title;
  final String backgroundURL;
  final String overview;
  MovieDetail(
      {required this.title,
      required this.backgroundURL,
      required this.overview});
}

class MovieGenre {
  final String id;
  final String name;
  MovieGenre({required this.id, required this.name});
}
