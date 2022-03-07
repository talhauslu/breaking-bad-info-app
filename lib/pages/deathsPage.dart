import 'package:breaking_bad/models/deathsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeathsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Deaths")),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            FutureBuilder(
                future: callDeaths(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (snapshot.hasData == false) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData) {
                        return Death(
                          death: snapshot.data[index]["death"],
                          cause: snapshot.data[index]["cause"],
                          episode: snapshot.data[index]["episode"].toString(),
                          season: snapshot.data[index]["season"].toString(),
                          responsible: snapshot.data[index]["responsible"],
                          lastwords: snapshot.data[index]["last_words"],
                          numberofdeaths: snapshot.data[index]
                                  ["number_of_deaths"]
                              .toString(),
                        );
                      }
                      return null;
                    },
                    physics: NeverScrollableScrollPhysics(),
                  );
                })
          ],
        ),
      ),
    );
  }
}
