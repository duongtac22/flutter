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
  // factory MovieModel2.fromJson(Map<String, dynamic> json) {
  //   return switch (json) {
  //     {
  //       'id': String id,
  //       'title': String title,
  //       'imageUrl': String imageUrl,
  //       'year': String year,
  //       'overview': String overview,
  //       'rating': double rating,
  //     } =>
  //       MovieModel2(
  //         id: id,
  //         title: title,
  //         imageUrl: imageUrl,
  //         year: year,
  //         overview: overview,
  //         rating: rating,
  //       ),
  //     _ => throw const FormatException('Failed to load album.'),
  //   };
  // }
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
