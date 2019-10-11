import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:moviesapp/pages/movielist.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  static String apiKey = "YourAPIKey";
  String url = "http://api.themoviedb.org/3/discover/movie?api_key=$apiKey";

  var movies;

  fetchMovies() async {
    var response = await http.get(url);
    var data = json.decode(response.body);

    setState(() {
      movies = data['results'];
    });
  }

  @override
  void initState() {
    fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("MovieApp"),
          centerTitle: true,
          actions: <Widget>[
            Switch(
              value: isDark,
              onChanged: (value) {
                setState(() {
                  isDark = value;
                });
              },
            )
          ],
        ),
        body: movies == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: _refreshController,
                child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, i) {
                    return MovieItem(
                      movie: movies[i],
                    );
                  },
                ),
              ),
      ),
    );
  }

  Future<void> _refreshController() async {
    setState(() {
     movies = null; 
    });

    fetchMovies();
  }
}
