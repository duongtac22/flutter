import 'package:flutter/material.dart';
import 'package:flutter_tutorial/common/settings.dart';
import 'package:flutter_tutorial/models/movie.dart';
import 'package:flutter_tutorial/screens/search_movie_screen.dart';
import 'package:flutter_tutorial/services/movies.dart';
import 'package:flutter_tutorial/widget/carousel_widget.dart';
import 'package:flutter_tutorial/widget/home_header.dart';
import 'package:flutter_tutorial/widget/movie_card.dart';
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
  // final _scrollController = ScrollController();
  final int _page = 1;
  int selectedGenre = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<MovieGenre> genres = [];
  // bool _isLoading = true;

  Future<void> loadData({String moviesType = 'popular', int page = 1}) async {
    MovieModels movieModel = MovieModels();
    _movieCards =
        await movieModel.getMovies(moviesType: moviesType, page: _page);
    // log('movieCards day temp: $_movieCards');
    temp.addAll(_movieCards!);
    // debugPrint('temp $temp');
  }

  Future<void> loadGenres() async {
    MovieModels movieModel = MovieModels();
    genres =
        await movieModel.getMovieGenre(url: '$apiGenreURL?api_key=$apiKey');
  }

  Future<void> fetchData() async {
    await loadData();
    await loadGenres();
  }

  // init state
  @override
  void initState() {
    setState(() {
      fetchData();
    });
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
        body: SafeArea(
            child: SingleChildScrollView(
                // controller: _scrollController,
                child: Column(children: [
          HomeHeader(size: size),
          // TextButton(
          //   onPressed: () {
          //     _scaffoldKey.currentState!.openDrawer();
          //   },
          //   child: const Text('Load More'),
          // ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
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
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGenre = index;
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
                              : BoxDecoration(color: Colors.transparent),
                          child: Text(
                            genres[index].name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                (temp.isEmpty)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 24),
                        child: (temp.isEmpty)
                            ? const Center(child: Text("Empty List "))
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
                                    : BoxDecoration(color: Colors.transparent),
                                child: Text(
                                  genres[index].name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ]),
        ]))),
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
