import 'package:flutter/material.dart';

class SearchMovieScreen extends StatefulWidget {
  final String searchQuery;
  const SearchMovieScreen({required this.searchQuery, super.key});
  @override
  // ignore: library_private_types_in_public_api
  SearchMovieScreenState createState() => SearchMovieScreenState();
}

class SearchMovieScreenState extends State<SearchMovieScreen> {
  // List<MovieCard>? _movieCards;

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // bool _isLoading = true;

  // Future<void> loadData() async {
  //   MovieModels movieModel = MovieModels();
  //   _movieCards = await movieModel.getMovies(moviesType: "popular");
  //   log('movieCards day : $_movieCards');
  //   setState(() {});
  // }
  // init state
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   loadData();
  // }

  @override
  void dispose() {
    super.dispose();
    // setState(() {
    //   _isLoading = true;
    // });
  }

  // build function
  @override
  Widget build(BuildContext context) {
    return Container(
      // show the search query in the screen for now
      child: Text(widget.searchQuery),
    );
  }
}
