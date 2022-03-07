import 'dart:convert';

import 'package:breaking_bad/pages/episodesPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../links.dart';

Future callEpisodes() async {
  final response = await http.get(Uri.parse(links["episodes"]));
  var result = json.decode(response.body);
  return (result);
}

class Episodes extends StatefulWidget {
  final String date;
  final String episode;
  final String title;
  Episodes({
    this.episode = "Episode",
    this.date = "date",
    this.title = "Title",
  });

  @override
  _EpisodesState createState() => _EpisodesState();
}

class _EpisodesState extends State<Episodes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
          child: Text(widget.episode + ".)" + widget.title),
        ),
        Container(
          padding: EdgeInsets.only(right: 20, left: 20, bottom: 15),
          alignment: Alignment.centerLeft,
          child: Text(
            widget.date,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Divider(
          height: 0,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class Deneme extends StatefulWidget {
  @override
  _DenemeState createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: callEpisodes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data?.length ?? 1,
            itemBuilder: (BuildContext context, int index) {
              if (snapshot.hasData == false) {
                if (s == null) {
                  s = 1;
                }
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData &&
                      snapshot.data[index]["series"] ==
                          ""
                              "Breaking Bad" &&
                      snapshot.data[index]["season"] == s.toString() ||
                  snapshot.data[index]["season"] == s.toString() + " " ||
                  snapshot.data[index]["season"] == " " + s.toString()) {
                /*widget
                                      .createState()
                                      .didUpdateWidget(EpisodesPage());
                                  widget.createElement().dependOnInheritedElement();
                                  */
                return Episodes(
                  title: snapshot.data[index]["title"],
                  date: snapshot.data[index]["air_date"],
                  episode: snapshot.data[index]["episode"].toString(),
                );
              }
              return null;
            },
            physics: NeverScrollableScrollPhysics(),
          );
        });
  }
}
