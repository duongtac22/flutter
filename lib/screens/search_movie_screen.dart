import 'dart:developer';

import 'package:flutter/material.dart';

import '../services/movies.dart';
import '../widget/movie_card.dart';
import '../widget/movie_card_container.dart';

class SearchMovieScreen extends StatefulWidget {
  final String searchQuery;
  const SearchMovieScreen({required this.searchQuery, super.key});
  @override
  SearchMovieScreenState createState() => SearchMovieScreenState();
}

class SearchMovieScreenState extends State<SearchMovieScreen> {
  // demo url https://api.themoviedb.org/3/search/movie
  List<MovieCard>? _movieCards;

  // bool _isLoading = true;

  Future<void> loadData(String movieName) async {
    MovieModels movieModel = MovieModels();
    _movieCards = await movieModel.searchMovies(searchName: movieName);
    log('search movieCards day : $_movieCards');
    setState(() {});
  }

  // init state
  @override
  void initState() {
    super.initState();
    () async {
      setState(() {
        loadData(widget.searchQuery);
      });
    }();
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Search movie : ${widget.searchQuery}'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: (_movieCards == null)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: (_movieCards!.isEmpty)
                            ? const Center(child: Text("Empty List "))
                            : MovieCardContainer(movieCards: _movieCards!)),
                  ]),
      )),
    );
  }
}
