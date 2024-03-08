import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/search_movie_screen.dart';
import 'package:flutter_tutorial/services/movies.dart';
import 'package:flutter_tutorial/widget/home_header.dart';
import 'package:flutter_tutorial/widget/movie_card.dart';
import 'package:flutter_tutorial/widget/movie_card_container.dart';
import 'package:flutter_tutorial/widget/search_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<MovieCard>? _movieCards;
  List<MovieCard> temp = [];
  final _scrollController = ScrollController();
  int _page = 1;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // bool _isLoading = true;

  Future<void> loadData({String moviesType = 'popular', int page = 1}) async {
    MovieModels movieModel = MovieModels();
    _movieCards =
        await movieModel.getMovies(moviesType: moviesType, page: _page);
    // log('movieCards day temp: $_movieCards');
    temp.addAll(_movieCards!);
    // debugPrint('temp $temp');
    setState(() {});
  }

  // init state
  @override
  void initState() {
    setState(() {
      loadData();
    });
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        log('reach end ${++_page}');
        loadData(moviesType: 'popular', page: ++_page);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    setState(() {
      _scrollController.dispose();
    });
  }

  // build function
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(children: [
                  HomeHeader(size: size),
                  (temp.isEmpty)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 24),
                                child: CustomSearchAppbarContent(
                                  onSubmitted: (value) {
                                    if (value.isEmpty) return;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchMovieScreen(
                                                  searchQuery: value,
                                                )));
                                  },
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: (temp.isEmpty)
                                      ? const Center(child: Text("Empty List "))
                                      : MovieCardContainer(movieCards: temp)),
                              const SizedBox(height: 24)
                            ]),
                ]))));
  }
}
