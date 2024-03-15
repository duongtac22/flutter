import 'package:flutter/material.dart';
import 'package:flutter_tutorial/common/settings.dart';
import 'package:flutter_tutorial/models/movie.dart';
import 'package:flutter_tutorial/screens/search_movie_screen.dart';
import 'package:flutter_tutorial/services/movies.dart';
import 'package:flutter_tutorial/widget/carousel_widget.dart';
import 'package:flutter_tutorial/widget/home_header.dart';
import 'package:flutter_tutorial/widget/movie_card.dart';
import 'package:flutter_tutorial/widget/movie_card_container.dart';
import 'package:flutter_tutorial/widget/search_appbar.dart';
import 'package:flutter_tutorial/widget/skeleton/skeleton-movie-slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<MovieCard>? _movieCards;
  List<MovieCard> temp = [];
  List<MovieCard> movvieByGenre = [];

  // final _scrollController = ScrollController();
  final int _page = 1;
  int selectedGenre = 0;
  int selectedType = 0;

  List<MovieGenre> genres = [];
  // bool _isLoading = true;

  List<MovieType> movieTypes = [
    MovieType(type: 'popular', name: 'Popular'),
    MovieType(type: 'top_rated', name: 'Top Rated'),
    MovieType(type: 'upcoming', name: 'Upcoming'),
    MovieType(type: 'now_playing', name: 'Now Playing'),
  ];

  Future<void> loadData({String moviesType = 'popular', int page = 1}) async {
    MovieModels movieModel = MovieModels();
    _movieCards =
        await movieModel.getMovies(moviesType: moviesType, page: _page);
    // log('movieCards day temp: $moviesType');

    // debugPrint('temp $temp');
    setState(() {
      temp = _movieCards!;
    });
  }

  Future<void> loadGenres() async {
    MovieModels movieModel = MovieModels();
    genres =
        await movieModel.getMovieGenre(url: '$apiGenreURL?api_key=$apiKey');
    setState(() {});
  }

  Future<void> loadMovieByGenre({required String genreId}) async {
    MovieModels movieModel = MovieModels();
    movvieByGenre = await movieModel.getMovieByGenre(genreId: genreId);
    setState(() {
      // movvieByGenre;
    });
  }

  Future<void> fetchData() async {
    await loadData();
    await loadGenres();
    // loadMovieByGenre run after loadGenres finised
    await loadMovieByGenre(genreId: genres[0].id);
  }

  // init state
  @override
  void initState() {
    () async {
      fetchData();
    }();
    // _scrollController.addListener(() {
    //   if (_scrollController.position.maxScrollExtent ==
    //       _scrollController.offset) {
    //     log('reach end ${++_page}');
    //     loadData(moviesType: 'popular', page: ++_page);
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // setState(() {
    //   _scrollController.dispose();
    // });
  }

  // build function
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
            // controller: _scrollController,
            child: Column(children: [
          HomeHeader(size: size),
          // TextButton(
          //   onPressed: () {
          //     _scaffoldKey.currentState!.openDrawer();
          //   },
          //   child: const Text('Load More'),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: CustomSearchAppbarContent(
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
          ),

          SizedBox(
            height: size.height / 18,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieTypes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedType = index;
                      loadData(moviesType: movieTypes[index].type);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 16),
                    alignment: Alignment.center,
                    width: size.width / 4,
                    decoration: selectedType == index
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.deepPurple)
                        : const BoxDecoration(color: Colors.transparent),
                    child: Text(
                      movieTypes[index].name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: (temp.isEmpty)
                ? Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      children: [
                        SkeletonMovieSlide(
                          width: size.width - 32,
                          height: 200,
                        )
                      ],
                    ),
                  )
                : CarouselWidget(temp: temp, size: size),
          ),
          (genres.isEmpty)
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: size.height / 18,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGenre = index;

                            loadMovieByGenre(
                                genreId: genres[index].id.toString());
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 16),
                          alignment: Alignment.center,
                          width: size.width / 4,
                          decoration: selectedGenre == index
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.deepPurple)
                              : const BoxDecoration(color: Colors.transparent),
                          child: Text(
                            genres[index].name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                        ),
                      );
                    },
                  ),
                ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: (movvieByGenre.isEmpty)
                ? Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      children: [
                        SkeletonMovieSlide(
                          width: size.width - 32,
                          height: 200,
                        )
                      ],
                    ),
                  )
                : SizedBox(
                    width: size.width,
                    height: 400,
                    child: MovieCardContainer(movieCards: movvieByGenre)),
          ),
        ])),
        drawer: Drawer(
          child: Container(
              color: Colors.deepPurple,
              child: ListView(
                children: const [
                  DrawerHeader(
                      child: Center(
                    child: Text('Drawer Header'),
                  ))
                ],
              )),
        ));
  }
}
