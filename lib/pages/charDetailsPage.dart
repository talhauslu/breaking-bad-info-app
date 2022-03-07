import 'package:breaking_bad/models/charactersModel.dart';
import 'package:flutter/material.dart';

class CharDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: FutureBuilder(
        future: callChars(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var choosen;
          if (snapshot.hasData) {
            for (var char in snapshot.data) {
              if (char["char_id"] == arguments["id"]) {
                choosen = char;
              }
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
          if (choosen != null) {
            return Center(child: Text(choosen["name"]));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class RandomCharDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        tooltip: "Another one!",
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => RandomCharDetailsPage()));
        },
      ),
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: FutureBuilder(
        future: callRandomChar(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var choosen;
          if (snapshot.hasData) {
            choosen = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 20,
                      ),
                      Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width * .8,
                        child: Image.network(
                          choosen["img"],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(choosen["name"]),
                    ],
                  ),
                ),
                /*
                Container(
                  child: InkWell(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RandomCharDetailsPage())),
                    child: Container(
                      color: Theme.of(context).accentColor,
                      height: 60,
                      child: Row(
                        children: [
                          Icon(
                            Icons.refresh,
                            color: Colors.white,
                            size: 30,
                          ),
                          Container(
                            width: 10,
                            color: Colors.transparent,
                          ),
                          Text(
                            "Another One",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ),
                )
                */
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      //FutureBuilder
    );
  }
}
