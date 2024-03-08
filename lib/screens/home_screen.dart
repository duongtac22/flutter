import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/search_movie_screen.dart';
import 'package:flutter_tutorial/services/movies.dart';
import 'package:flutter_tutorial/widget/movie_card.dart';
import 'package:flutter_tutorial/widget/movie_card_container.dart';
import 'package:flutter_tutorial/widget/search_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.indigo[500],
        body: SafeArea(
            child: SingleChildScrollView(
          controller: _scrollController,
          child: (temp.isEmpty)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Text(
                          'What do you want to watch?',
                          style: GoogleFonts.roboto(
                            fontSize: 24,
                            color: Colors.white,
                            height: 1,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomSearchAppbarContent(
                        onSubmitted: (value) {
                          if (value.isEmpty) return;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchMovieScreen(
                                        searchQuery: value,
                                      )));
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: (temp.isEmpty)
                              ? const Center(child: Text("Empty List "))
                              : MovieCardContainer(movieCards: temp)),
                      const SizedBox(height: 24),
                    ]),
        )));
  }
}
