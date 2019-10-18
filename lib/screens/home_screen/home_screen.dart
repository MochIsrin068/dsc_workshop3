import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moviecatalogue_api/screens/home_screen/widgets/highlight_card.dart';
import 'package:moviecatalogue_api/screens/home_screen/widgets/trending_card.dart';
import 'package:http/http.dart' as http;
import 'api.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future _movieDiscover() async {
    var api = await http.get(apiDiscover);
    var res = json.decode(api.body);
    return res;
  }

  Future _movieTrend() async {
    var api = await http.get(apiTrend);
    var res = json.decode(api.body);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              alignment: Alignment.topLeft,
              child: Text(
                "Movies",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1A1A4E),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            Container(
                height: 300.0,
                child: FutureBuilder(
                  future: _movieDiscover(),
                  builder: (context, snapshot) {
                    return snapshot.data != null
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, i) {
                              var _data = snapshot.data;
                              return HighlightCard(
                                imgURL: _data["results"][i]["poster_path"],
                                movieDate: _data["results"][i]["release_date"],
                                movieName: _data["results"][i]["title"],
                                moviePopularity:
                                    "${_data["results"][i]["popularity"]}",
                                imgBackdrop: _data["results"][i]
                                    ["backdrop_path"],
                                movieOverview: _data["results"][i]["overview"],
                                movieVoteAverage:
                                    "${_data["results"][i]["vote_average"]}",
                              );
                            },
                          )
                        : Center(child: CircularProgressIndicator());
                  },
                )),
            Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.topLeft,
              child: Text(
                "Trending",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1A1A4E),
                ),
              ),
            ),
            Container(
                // height: 200.0,
                child: FutureBuilder(
              future: _movieTrend(),
              builder: (context, snapshot) {
                var _data = snapshot.data;
                return snapshot.data != null
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, i) {
                          return TrendingCard(
                            imgURL: _data["results"][i]["poster_path"],
                            movieDate: _data["results"][i]["release_date"],
                            moviePopularity:
                                "${_data["results"][i]["popularity"]}",
                            movieTitle: _data["results"][i]["title"],
                            imgBackdrop: _data["results"][i]["backdrop_path"],
                            movieOverview: _data["results"][i]["overview"],
                            movieVoteAverage: _data["results"][i]
                                ["vote_average"],
                          );
                        },
                      )
                    : Center(child: Text("Please Wait...."));
              },
            ))
          ],
        ),
      ),
    );
  }
}
