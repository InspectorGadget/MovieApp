import 'package:flutter/material.dart';
import 'package:moviesapp/pages/moviedetail.dart';

class MovieItem extends StatelessWidget {
  final movie;

  MovieItem({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 8.0,
      margin: EdgeInsets.all(16.0),
      child: InkWell(
        radius: 8.0,
        child: getCardView(context, movie),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MovieDetail(
              movie: movie,
            );
          }));
        },
      ),
    );
  }
}

getCardView(BuildContext context, movie) {
  final String imageUrl = "https://image.tmdb.org/t/p/w500/";

  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Hero(
        tag: movie['poster_path'],
        child: Container(
          height: 200.0,
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
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              movie['title'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                fontSize: 20.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3.0),
            ),
            Text(
              movie['overview'],
              maxLines: 3,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    ],
  );
}
