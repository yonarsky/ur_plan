import 'package:flutter/material.dart';
import 'database_provider.dart';
import 'course.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

String week1;
String week2;


class Timetable extends StatefulWidget {
  Timetable({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _TimetableState createState() => _TimetableState();

}

class _TimetableState extends State<Timetable> {

  bool isLoading;
  List<Lessons> lessonsList = new List();

  @override
  void initState() {
    week1 = 'A';
    week2 = 'B';
  }

  void fetchLessons(id, year, week) async {
    setState(() => isLoading = true);
    final tmpList = await DatabaseProvider.db.getLessons(id, year, week);
    setState(() {
      isLoading = false;
      lessonsList = tmpList;
    });
  }

  List<bool> isSelected = [true, false];



  Widget list() {
    return (StickyGroupedListView<dynamic, String>(
      elements: lessonsList,
      groupBy: (lessons) {
        return lessons.id_dnia.toString();
      },
      groupSeparatorBuilder: (lessons) => Text(
        lessons.dzien_tygodnia,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      floatingHeader: true,
      itemBuilder: (context, dynamic lessons) {

        return Card(

          child: ListTile(
            onTap: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(lessons.nazwa_przedmiotu),
                duration: Duration(seconds: 2),
              ));
            },
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(lessons.godzina),
              ],
            ),
            title: Text(lessons.skrot),
            subtitle: Text(lessons.imie_nazwisko + ", " + lessons.numer_sali),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(lessons.typ_grupy),
              ],
            ),
            isThreeLine: true,
            hoverColor: Colors.blue[900],
          ),
        );
      },
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    fetchLessons(idC, year, week1);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(year.toString() + " | " + nameCourse),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: <Widget> [
           Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            //padding: EdgeInsets.all(20),
            child:  ToggleButtons(
              isSelected: isSelected,
              selectedColor: Colors.white,
              fillColor: Colors.blue[900],
              borderColor: Colors.blue[900],
              selectedBorderColor: Colors.blue[900],
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Text('Tydzień A'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Text('Tydzień B'),
                ),
              ],
              onPressed: (int newIndex) {
                setState(() {
                  for (int index = 0; index < isSelected.length; index++) {
                    if (index == newIndex) {
                      isSelected[index] = true;
                    } else {
                      isSelected[index] = false;
                    }
                  }
                  String tmp = week1;
                  week1 = week2;
                  week2 = tmp;
                  fetchLessons(idC, year, week1);
                });
              },
            ),
          ),
            Expanded(child: list())
        ]),
        //child: list();
    );
  }
}