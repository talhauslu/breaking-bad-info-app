import 'dart:convert';

import 'package:breaking_bad/links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const fotolink =
    'https://static.wikia.nocookie.net/breakingbad/images/7/78/Logo_breaking_bad.png/revision/latest?cb=20180801024750&path-prefix=es';

Future callRandomChar() async {
  final response = await http.get(Uri.parse(links["randomChar"]));
  var result = json.decode(response.body)[0];
  return (result);
}

Future callChars() async {
  final response = await http.get(Uri.parse(links["chars"]));
  var result = json.decode(response.body);
  return (result);
}

class CharacterInstance extends StatelessWidget {
  final String charPicLink;
  final String charName;
  final String charNickName;
  final int id;
  CharacterInstance({
    this.charPicLink = fotolink,
    this.charName = "Name of character",
    this.charNickName = "Nickname of character",
    this.id,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
      ),
      width: 160,
      height: 290,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/cdetail", arguments: {"id": id});
        },
        child: Column(
          children: [
            Image.network(
              charPicLink,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 200,
                  width: 160,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  ),
                );
              },
              width: 160,
              height: 200,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      "Name",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white70,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7, right: 3, left: 3),
                    child: Text(
                      charName,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 17),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    child: Text(
                      "($charNickName)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white70,
                          fontStyle: FontStyle.italic,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CharacterInstanceDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
      ),
      width: 160,
      height: 290,
      child: InkWell(
        onTap: () {
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Loading..."),
                  content: Text(
                      "If not loaded please check your internet connection."),
                );
              });
        },
        child: Column(
          children: [
            Image.asset(
              "images/logo.png",
              width: 160,
              height: 200,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      "Name",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white70,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7, right: 3, left: 3),
                    child: Text(
                      "Name of character",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 17),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    child: Text(
                      "Nickname of character",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white70,
                          fontStyle: FontStyle.italic,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
