import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/home_screen.dart';

const apiURL = "https://api.themoviedb.org/3/movie";
const apiGenreURL = "https://api.themoviedb.org/3/genre/movie/list";
const apiImageURL = "https://image.tmdb.org/t/p/w300";
const apiDetailMovie = "https://api.themoviedb.org/3/movie/";
const apiSearchMovie = "https://api.themoviedb.org/3/search/movie";
const apiKey = "d3150e83a35a557026d9e1bc83a4fbc5";
final GlobalKey<HomeScreenState> homeScreenKey = GlobalKey();
