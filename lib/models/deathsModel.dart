import 'dart:convert';

import 'package:breaking_bad/links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future callDeaths() async {
  final response = await http.get(Uri.parse(links["deaths"]));
  var result = json.decode(response.body);
  return (result);
}

class Death extends StatelessWidget {
  final String death;
  final String responsible;
  final String cause;
  final String season;
  final String episode;
  final String lastwords;
  final String numberofdeaths;
  Death(
      {this.death = "Death",
      this.responsible = "responsible",
      this.cause = "cause",
      this.lastwords = "last words",
      this.season = "0",
      this.episode = "0",
      this.numberofdeaths = "0"});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          alignment: Alignment.centerLeft,
          child: Text(
            death,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          alignment: Alignment.centerLeft,
          child: Text(
            cause + " by " + responsible,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 20, left: 20, bottom: 15),
          alignment: Alignment.centerLeft,
          child: Text(
            numberofdeaths +
                " death" +
                "            " +
                "at S" +
                season +
                "E" +
                episode,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Divider(
          height: 0,
          color: Colors.grey,
        )
      ],
    );
  }
}
