import 'package:flutter/material.dart';
import 'package:flutter_tutorial/common/settings.dart';
import 'package:flutter_tutorial/models/movie.dart';
import 'package:flutter_tutorial/services/movies.dart';

class DetailMovieScreen extends StatefulWidget {
  final String id;
  final String title;
  const DetailMovieScreen({required this.id, required this.title, super.key});
  @override
  // ignore: library_private_types_in_public_api
  _DetailMovieScreenState createState() => _DetailMovieScreenState();

  Future<MovieDetail> loadDetail() async {
    MovieModels movieModel = MovieModels();
    MovieDetail temp = await movieModel.getMovieDetail(movieId: id);
    return temp;
  }
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  MovieDetail? movieDetails;
  @override
  void initState() {
    super.initState();
    () async {
      MovieDetail temp = await widget.loadDetail();
      setState(() {
        movieDetails = temp;
      });
    }();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie name : ${movieDetails?.title ?? ''}'),
      ),
      body: (movieDetails?.title == null)
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Loading...'),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    '$apiImageURL${movieDetails?.backgroundURL}',
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      movieDetails?.title ?? '',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (movieDetails!.overview != "")
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          movieDetails?.overview ?? '',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}



// class DetailMovieScreen extends StatelessWidget {
//   final String id ;
//   final String title ;
//   const DetailMovieScreen({required this.id, required this.title, super.key});


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(id),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Text(title),
//       ),
//     );
//   }
// }