import 'package:breaking_bad/models/quotesModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quotes")),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            FutureBuilder(
                future: callQuotes(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (snapshot.hasData == false) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData &&
                          snapshot.data[index]["series"] == "Breaking Bad") {
                        return Quote(
                          char: snapshot.data[index]["author"],
                          quotee: snapshot.data[index]["quote"],
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
