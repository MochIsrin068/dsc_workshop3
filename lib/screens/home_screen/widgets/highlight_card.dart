import 'package:flutter/material.dart';

import '../details_screen.dart';

class HighlightCard extends StatelessWidget {
  final String imgURL;
  final String movieName;
  final String movieDate;

  final String moviePopularity;
  final String movieVoteAverage;
  final String movieOverview;
  final String imgBackdrop;

  HighlightCard(
      {this.imgURL,
      this.movieName,
      this.movieDate,
      this.moviePopularity,
      this.movieVoteAverage,
      this.movieOverview,
      this.imgBackdrop});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      margin: EdgeInsets.all(8.0),
      child: RawMaterialButton(
        child: Column(
          children: <Widget>[
            Container(
              height: 222.0,
              width: 167.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image:
                      NetworkImage("https://image.tmdb.org/t/p/w500/$imgURL"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    movieName,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    movieDate,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ViewDetails(
                  imgBackdrop: "https://image.tmdb.org/t/p/w500/$imgBackdrop",
                  movieDate: movieDate,
                  movieOverview: movieOverview,
                  moviePopularity: moviePopularity,
                  movieRate: "$movieVoteAverage",
                  movieTitle: movieName),
            ),
          );
        },
      ),
    );
  }
}
