import 'package:flutter/material.dart';

import '../details_screen.dart';

class TrendingCard extends StatelessWidget {
  final String imgURL;
  final String movieTitle;
  final String movieDate;
  final String moviePopularity;

  final double movieVoteAverage;
  final String movieOverview;
  final String imgBackdrop;

  TrendingCard(
      {this.imgURL,
      this.movieTitle,
      this.movieDate,
      this.moviePopularity,
      this.movieVoteAverage,
      this.movieOverview,
      this.imgBackdrop});

  trendingCardImage(String _imgURL) {
    return Container(
      height: 116.0,
      width: 84.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          image: NetworkImage(_imgURL),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: RawMaterialButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child:
                  trendingCardImage("https://image.tmdb.org/t/p/w500/$imgURL"),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      movieTitle,
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
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.thumb_up,
                          color: Colors.cyan,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          moviePopularity,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
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
                movieTitle: movieTitle,
              ),
            ),
          );
        },
      ),
    );
  }
}
