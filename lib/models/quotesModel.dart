import 'dart:convert';

import 'package:breaking_bad/links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future callQuotes() async {
  final response = await http.get(Uri.parse(links["quotes"]));
  var result = json.decode(response.body);
  return (result);
}

class Quote extends StatelessWidget {
  final String quotee;
  final String char;
  Quote({this.char = "-author", this.quotee = "Quote"});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Text(
            '"' + quotee + '"',
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '- ' + char,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              width: 50,
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 0,
          color: Colors.grey,
        )
      ],
    );
  }
}
