import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'file:///C:/Users/Talha/AndroidStudioProjects/breaking_bad/lib/pages/charDetailsPage.dart';

import 'models/mainPageItems.dart';
import 'pages/charactersPage.dart';
import 'pages/deathsPage.dart';
import 'pages/episodesPage.dart';
import 'pages/quotesPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(),
        "/characters": (context) => CharactersPage(),
        "/episodes": (context) => EpisodesPage(),
        "/quotes": (context) => QuotesPage(),
        "/deaths": (context) => DeathsPage(),
        "/cdetail": (context) => CharDetailsPage(),
        "/rcdetail": (context) => RandomCharDetailsPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Breaking Bad Info",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            NewElement(
              elementTitle: "Characters",
              elementIcon: Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
              routePage: "/characters",
            ),
            NewElement(
              elementTitle: "Episodes",
              elementIcon: Icon(
                Icons.live_tv_rounded,
                size: 40,
                color: Colors.white,
              ),
              routePage: "/episodes",
            ),
            NewElement(
              elementTitle: "Quotes",
              elementIcon: Icon(
                Icons.format_quote_rounded,
                color: Colors.white,
                size: 40,
              ),
              routePage: "/quotes",
            ),
            NewElement(
              elementTitle: "Deaths",
              elementIcon: Icon(
                Icons.person_remove_alt_1_rounded,
                color: Colors.white,
                size: 40,
              ),
              routePage: "/deaths",
            ),
          ],
        ),
      ),
    );
  }
}

ThemeData appTheme = new ThemeData(
  primaryColor: Colors.green[900],
  accentColor: Colors.green[900],
  backgroundColor: Colors.green[700],
  scaffoldBackgroundColor: Colors.green[700],
);
