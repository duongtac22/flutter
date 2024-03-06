

// late TabController tabController;

// class TabbedContainer extends StatelessWidget {
//   const TabbedContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const DefaultTabController(
//       length: 2,
//       child: SizedBox(
//         width: double.infinity,
//         height: 380,
//         child: HomeMovieTabs(),
//       ),
//     );
//   }
// }

// // create PresentMoviesList widget
// class PresentMoviesList extends StatelessWidget {
//   const PresentMoviesList({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//         scrollDirection: Axis.horizontal,
//         shrinkWrap: true,
//         itemCount: movies.length,
//         separatorBuilder: (BuildContext context, int index) {
//           return const SizedBox(width: 10);
//         },
//         itemBuilder: (BuildContext context, int index) {
//           // final movie = movies[index];
//           return GestureDetector(
//             child: SizedBox(
//               width: 150,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image(
//                       image: AssetImage(movies[index].poster),
//                       width: 150,
//                       height: 180,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     movies[index].title,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }

// class ComingSoonMoviesList extends StatelessWidget {
//   const ComingSoonMoviesList({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: moviesComingSoon.length,
//         itemBuilder: (BuildContext context, int index) {
//           // final movie = movies[index];
//           return Container(
//               padding: const EdgeInsets.all(10),
//               width: 200,
//               child: Wrap(
//                 children: [
//                   SizedBox(
//                     width: 200,
//                     child: ClipRRect(
//                       borderRadius: const BorderRadius.all(Radius.circular(8)),
//                       child: Image(
//                         image: AssetImage(moviesComingSoon[index].poster),
//                         fit: BoxFit.fitWidth,
//                         width: 200,
//                         height: 160,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Text(
//                       moviesComingSoon[index].title,
//                       style: const TextStyle(
//                           fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ));
//         });
//   }
// }

// class HomeMovieTabs extends StatelessWidget {
//   const HomeMovieTabs({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             TabBar(
//               tabAlignment: TabAlignment.start,
//               labelPadding: EdgeInsetsDirectional.only(end: 24.0),
//               labelColor: Colors.amber,
//               isScrollable: true,
//               labelStyle: TextStyle(
//                   fontSize: 18.0,
//                   fontFamily: 'Family Name',
//                   fontWeight: FontWeight.w500), //For Selected tab
//               unselectedLabelStyle: TextStyle(
//                   fontSize: 18.0,
//                   fontFamily: 'Family Name',
//                   fontWeight: FontWeight.w500), //For Un-selected Tabs
//               tabs: <Widget>[
//                 Tab(
//                   text: "ĐANG CHIẾU",
//                 ),
//                 Tab(
//                   text: "SẮP CHIẾU",
//                 )
//               ],
//             ),
//             Expanded(
//               child: TabBarView(
//                 children: <Widget>[
//                   // color: Colors.green,
//                   // call another widget here
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 16),
//                       child: PresentMoviesList(),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 16),
//                       child: ComingSoonMoviesList(),
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: 500,
//                   //   width: double.infinity,
//                   //   child: ComingSoonMoviesList(),
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }

// class MovieListScreen extends StatefulWidget {
//   const MovieListScreen({super.key});
//   @override
//   // ignore: library_private_types_in_public_api
//   _MovieListScreenState createState() => _MovieListScreenState();
// }

// class _MovieListScreenState extends State<MovieListScreen> {
//   List<MovieCard>? _movieCards;

//   Future<void> loadData() async {
//     MovieModels movieModel = MovieModels();
//     _movieCards = await movieModel.getMovies(moviesType: "popular");
//   }

//   // init state
//   @override
//   void initState() {
//     super.initState();
//     () async {
//       setState(() {
//         loadData();
//       });
//     }();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     loadData();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   // build function
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // body: Center(
//         //   // FutureBuilder
//         //   child: FutureBuilder(
//         //     future: loadData(),
//         //     builder: (BuildContext context, AsyncSnapshot snapshot) {
//         //       if (snapshot.connectionState == ConnectionState.done) {
//         //         log(snapshot.data);
//         //       } else {
//         //         return const CircularProgressIndicator();
//         //       }
//         //     },
//         //   ),
//         // ),
//         child: (_movieCards == null)
//             ? const CircularProgressIndicator()
//             : (_movieCards!.isEmpty)
//                 ? const Center(child: Text("asldkajsd "))
//                 : MovieCardContainer(movieCards: _movieCards!));
//   }

//   Widget buildMovies(List<MovieModel2> movies) {
//     // ListView Builder to show data in a list
//     return ListView.builder(
//       itemCount: movies.length,
//       itemBuilder: (context, index) {
//         final movies0 = movies[index];
//         return MovieCard(movieModel2: movies0);
//       },
//     );
//   }
// }

// class SampleItemListView extends StatelessWidget {
//   const SampleItemListView({
//     super.key,
//     this.items = const <MovieModel>[],
//   });

//   static const routeName = '/';

//   final List<MovieModel> items;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Scaffold(
//           resizeToAvoidBottomInset: false,
//           appBar: AppBar(
//             title: const Text(
//               'Flutter Movie App',
//               style: TextStyle(color: Colors.white),
//             ),
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.settings),
//                 color: Colors.white,
//                 onPressed: () {
//                   // Navigate to the settings page. If the user leaves and returns
//                   // to the app after it has been killed while running in the
//                   // background, the navigation stack is restored.
//                   Navigator.restorablePushNamed(
//                       context, SettingsView.routeName);
//                 },
//               ),
//             ],
//             backgroundColor: Colors.blue,
//           ),

//           // To work with lists that may contain a large number of items, it’s best
//           // to use the ListView.builder constructor.
//           //
//           // In contrast to the default ListView constructor, which requires
//           // building all Widgets up front, the ListView.builder constructor lazily
//           // builds Widgets as they’re scrolled into view.
//           body: const SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Movies',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   // SizedBox(
//                   //   height: 200,
//                   //   width: double.infinity,
//                   //   child: ListView.builder(
//                   //     scrollDirection: Axis.horizontal,
//                   //     itemCount: movies.length,
//                   //     itemBuilder: (BuildContext context, int index) {
//                   //       // final movie = movies[index];
//                   //       return Padding(
//                   //           padding: const EdgeInsets.all(10),
//                   //           child: ClipRRect(
//                   //               borderRadius: BorderRadius.circular(8),
//                   //               child: SizedBox(
//                   //                 width: 150,
//                   //                 height: 200,
//                   //                 child: Image(
//                   //                     image: AssetImage(movies[index].poster),
//                   //                     fit: BoxFit.cover),
//                   //               )));
//                   //     },
//                   //   ),
//                   // ),
//                   // const SizedBox(height: 20),
//                   // const TabbedContainer(),
//                   MovieListScreen(),
//                 ],
//               ),
//             ),
//           )),
//     );
//   }
// }
