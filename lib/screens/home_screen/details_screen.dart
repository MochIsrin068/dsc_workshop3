import 'package:flutter/material.dart';

class ViewDetails extends StatefulWidget {
  String imgBackdrop;
  String movieTitle;
  String movieRate;
  String moviePopularity;
  String movieDate;
  String movieOverview;

  ViewDetails(
      {this.imgBackdrop,
      this.movieTitle,
      this.movieRate,
      this.moviePopularity,
      this.movieDate,
      this.movieOverview});

  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.imgBackdrop),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              Container(
                                padding: EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      widget.movieTitle,
                                      style: TextStyle(
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "R | Crime, Drama, Thriller",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: ListView(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        widget.movieRate,
                                        style: TextStyle(
                                          color: Color(0xff1A1A4E),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Rating",
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 32.0,
                                  child: VerticalDivider(
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        widget.moviePopularity,
                                        style: TextStyle(
                                          color: Color(0xff1A1A4E),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Popularity",
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 32.0,
                                  child: VerticalDivider(
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        widget.movieDate,
                                        style: TextStyle(
                                          color: Color(0xff1A1A4E),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Release Date",
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Synopsis",
                                  style: TextStyle(
                                    color: Color(0xff1A1A4E),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.movieOverview,
                                  style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 12.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
