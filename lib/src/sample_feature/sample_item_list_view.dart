import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/movie.dart';

import '../../dummy_data.dart';
import '../settings/settings_view.dart';

late TabController tabController;

class TabbedContainer extends StatelessWidget {
  const TabbedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: SizedBox(
        width: double.infinity,
        height: 380,
        child: HomeMovieTabs(),
      ),
    );
  }
}

// create PresentMoviesList widget
class PresentMoviesList extends StatelessWidget {
  const PresentMoviesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          // final movie = movies[index];
          return Container(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                      width: 200,
                      height: 200,
                      // child: Image(
                      //     image: AssetImage(movies[index].poster),
                      //     fit: BoxFit.cover),
                      child: SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage(movies[index].poster),
                              fit: BoxFit.fill,
                              height: 150,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                movies[index].title,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ))));
        });
  }
}

class ComingSoonMoviesList extends StatelessWidget {
  const ComingSoonMoviesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moviesComingSoon.length,
        itemBuilder: (BuildContext context, int index) {
          // final movie = movies[index];
          return Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                      width: 150,
                      height: 200,
                      // child: Image(
                      //     image: AssetImage(movies[index].poster),
                      //     fit: BoxFit.cover),
                      child: Card(
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            child: SizedBox(
                              width: 150,
                              height: double.minPositive,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        moviesComingSoon[index].poster),
                                    height: 200,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      moviesComingSoon[index].title,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ))));
        });
  }
}

class HomeMovieTabs extends StatelessWidget {
  const HomeMovieTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TabBar(
              tabAlignment: TabAlignment.start,
              labelPadding: EdgeInsetsDirectional.only(end: 24.0),
              labelColor: Colors.amber,
              isScrollable: true,
              labelStyle: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Family Name',
                  fontWeight: FontWeight.w500), //For Selected tab
              unselectedLabelStyle: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Family Name',
                  fontWeight: FontWeight.w500), //For Un-selected Tabs
              tabs: <Widget>[
                Tab(
                  text: "ĐANG CHIẾU",
                ),
                Tab(
                  text: "SẮP CHIẾU",
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  // color: Colors.green,
                  // call another widget here
                  Expanded(
                    child: PresentMoviesList(),
                  ),
                  Expanded(
                    child: ComingSoonMoviesList(),
                  ),
                  // SizedBox(
                  //   height: 500,
                  //   width: double.infinity,
                  //   child: ComingSoonMoviesList(),
                  // ),
                ],
              ),
            ),
          ],
        ));
  }
}

class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const <MovieModel>[],
  });

  static const routeName = '/';

  final List<MovieModel> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Movie App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),

        // To work with lists that may contain a large number of items, it’s best
        // to use the ListView.builder constructor.
        //
        // In contrast to the default ListView constructor, which requires
        // building all Widgets up front, the ListView.builder constructor lazily
        // builds Widgets as they’re scrolled into view.
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Movies',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      // final movie = movies[index];
                      return Padding(
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox(
                                width: 150,
                                height: 200,
                                child: Image(
                                    image: AssetImage(movies[index].poster),
                                    fit: BoxFit.cover),
                              )));
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const TabbedContainer(),
              ],
            ),
          ),
        ));
  }
}
