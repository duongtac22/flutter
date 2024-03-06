import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/search_movie_screen.dart';
import 'package:flutter_tutorial/services/movies.dart';
import 'package:flutter_tutorial/widget/movie_card.dart';
import 'package:flutter_tutorial/widget/movie_card_container.dart';
import 'package:flutter_tutorial/widget/search_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<MovieCard>? _movieCards;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // bool _isLoading = true;

  Future<void> loadData() async {
    MovieModels movieModel = MovieModels();
    _movieCards = await movieModel.getMovies(moviesType: "popular");
    log('movieCards day : $_movieCards');
    setState(() {});
  }

  // init state
  @override
  void initState() {
    () async {
      setState(() {
        loadData();
      });
    }();
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
    log('_movieCards home Screen : $_movieCards');
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.indigo[500],
        // To work with lists that may contain a large number of items, it’s best
        // to use the ListView.builder constructor.
        //
        // In contrast to the default ListView constructor, which requires
        // building all Widgets up front, the ListView.builder constructor lazily
        // builds Widgets as they’re scrolled into view.
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
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
                  onChanged: (value) => print(value),
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
                    child: (_movieCards!.isEmpty)
                        ? const Center(child: Text("Empty List "))
                        : MovieCardContainer(movieCards: _movieCards!)),
              ]),
        )));
  }
}
