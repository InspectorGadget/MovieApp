import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  final movie;

  MovieDetail({@required this.movie});

  @override
  Widget build(BuildContext context) {
    final String imageUrl = "https://image.tmdb.org/t/p/w500/";

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: movie['poster_path'],
                    child: Container(
                      height: 500.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        image: DecorationImage(
                          image: NetworkImage(
                            imageUrl + movie['poster_path'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    movie['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    movie['overview'],
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
