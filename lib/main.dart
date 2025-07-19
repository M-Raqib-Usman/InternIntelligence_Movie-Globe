import 'package:flutter/material.dart';
import 'package:movie_globe/screens/Splash_Screen.dart';
import 'package:movie_globe/widgets/toprated.dart';
import 'package:movie_globe/widgets/trending.dart';
import 'package:movie_globe/widgets/tv.dart';
import 'package:movie_globe/main.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splash_screen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.purple,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies=[];
  List tv=[];
  final String apikey = '5b4fbf09a2a0fd79ef560d0a47675bf4';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1YjRmYmYwOWEyYTBmZDc5ZWY1NjBkMGE0NzY3NWJmNCIsIm5iZiI6MTc0NTI0NzE0My4yMzMsInN1YiI6IjY4MDY1YmE3MzdhNzIyYjg4NjhhMTlhYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XOxSlihmS8bqsbzN_TmcqKKyoz6cEUcFAARSypBRYxU';

  void initState(){
    loadmovies();
    super.initState();
  }
  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    Map trendingresult=await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult=await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult=await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies=trendingresult['results'];
      topratedmovies=topratedresult['results'];
      tv=tvresult['results'];
    });
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: Text('Movie Globe',style: TextStyle(fontSize: 35,
          color: Color(0xffa83232),
          fontWeight: FontWeight.bold),
      ),actions: [
        Icon(Icons.search),
        SizedBox(width: 10,)
      ],),
      body: ListView(
        children:[
          TvShows(tv: tv),
          TopRated(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies)
        ],
      ),
    );
  }
}
