import 'package:breaking_bad/models/charactersModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const fotolink =
    'https://static.wikia.nocookie.net/breakingbad/images/7/78/Logo_breaking_bad.png/revision/latest?cb=20180801024750&path-prefix=es';
String heisenberg =
    'https://playtusu.com/wp-content/uploads/2019/10/walter-white-Heisenberg.jpg';
String randomchar = "https://www.breakingbadapi.com/api/character/random";

class CharactersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/rcdetail");
        },
        child: Icon(Icons.refresh),
        tooltip: "Bring me a random character",
      ),
      appBar: AppBar(title: Text("Characters")),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            FutureBuilder(
                future: callChars(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 16 / 29,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      if (snapshot.hasData) {
                        return CharacterInstance(
                          id: snapshot.data[index]["char_id"],
                          charNickName: snapshot.data[index]["nickname"],
                          charName: snapshot.data[index]["name"],
                          charPicLink: snapshot.data[index]["img"],
                        );
                      }
                      return CharacterInstanceDefault();
                    },
                    shrinkWrap: true,
                    padding: EdgeInsets.all(12),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.length ?? 62,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
