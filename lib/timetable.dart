import 'package:flutter/material.dart';
import 'database_provider.dart';
import 'course.dart';


class Timetable extends StatefulWidget {
  Timetable({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _TimetableState createState() => _TimetableState();

}

class _TimetableState extends State<Timetable> {

  //bool isLoading;
  //List<Subjects> yearsList = new List();


  /*void fetchYears(courseId) async {
    setState(() => isLoading = true);
    final tmpList = await DatabaseProvider.db.getYears(courseId);
    setState(() {
      isLoading = false;
      yearsList = tmpList;
    });
  }*/

  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    //fetchYears(courseId);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(year.toString() + " | " + nameCourse),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView(children: <Widget>[
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
                });
              },
            ),
          ),
        ])
    );
  }
}
