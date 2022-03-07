import 'package:breaking_bad/models/episodesModel.dart';
import 'package:flutter/material.dart';

int s;

class EpisodesPage extends StatefulWidget {
  @override
  _EpisodesPageState createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Episodes"),
      ),
      body: Stack(
        children: [
          Container(
            height: 100,
            color: Colors.green,
            child: Opacity(
              opacity: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: GestureDetector(
                          child: Text("Season 1"),
                          onTap: () {
                            print("1'e basıldı");
                            setState(() {
                              s = 1;
                            });
                          },
                        ),
                      ),
                      Container(
                        child: GestureDetector(
                          child: Text("Season 2"),
                          onTap: () {
                            print("2'ye basıldı");
                            setState(() {
                              s = 2;
                            });
                          },
                        ),
                      ),
                      Container(
                        child: GestureDetector(
                          child: Text("Season 3"),
                          onTap: () {
                            print("3'e basıldı");
                            setState(() {
                              s = 3;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: GestureDetector(
                          child: Text("Season 4"),
                          onTap: () {
                            print("4'e basıldı");
                            setState(() {
                              s = 4;
                            });
                          },
                        ),
                      ),
                      Container(
                        child: GestureDetector(
                          child: Text("Season 5"),
                          onTap: () {
                            print("5'e basıldı");
                            setState(() {
                              s = 5;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 100,
              ),
              Container(
                height: MediaQuery.of(context).size.height -
                    (100 +
                        AppBar().preferredSize.height +
                        MediaQuery.of(context).padding.top +
                        MediaQuery.of(context).padding.bottom),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [Deneme()],
                  ),
                ),
              )
            ],
          ),
        ],
        alignment: AlignmentDirectional.topStart,
      ),
    );
  }
}
