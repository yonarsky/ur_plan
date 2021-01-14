import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String collegeName;
String collegeLetter;
// ignore: must_be_immutable
class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
    title: "Kolegium Nauk Humanistycznych",
    event: "H",
  );

  Items item2 = new Items(
    title: "Kolegium Nauk Medycznych",
    event: "M",
  );
  Items item3 = new Items(
    title: "Kolegium Nauk Przyrodniczych",
    event: "P",
  );
  Items item4 = new Items(
    title: "Kolegium Nauk Społecznych",
    event: "S",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    //var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.blue[900], borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/college');
                  collegeName = data.title;
                  collegeLetter = data.event;
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      data.event,
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              color: Colors.white24,
                              fontSize: 48,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String event;
  Items({this.title, this.event});
}
