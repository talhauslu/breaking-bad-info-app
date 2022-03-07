import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewElement extends StatelessWidget {
  /*void fetchChars() async {
    Response res = await get(Uri.parse(links["randomChar"]));
    var a = jsonDecode(res.body);
    print(a[0]["name"]);
  }
  */
  final String elementTitle;
  final Icon elementIcon;
  final String routePage;
  NewElement({this.elementTitle, this.elementIcon, this.routePage});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
        color: Colors.black26,
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: InkWell(
        onTap: () {
          //fetchChars();
          Navigator.pushNamed(context, routePage);
        },
        child: Container(
          alignment: Alignment.center,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            shape: BoxShape.rectangle,
            color: Colors.black26,
          ),
          child: ListTile(
            leading: elementIcon,
            title: Text(
              elementTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
