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

  bool isLoading;
  List<Days> daysList = new List();


  void fetchDays() async {
    setState(() => isLoading = true);
    final tmpList = await DatabaseProvider.db.getDays();
    setState(() {
      isLoading = false;
      daysList = tmpList;
    });
  }

  List<bool> isSelected = [true, false];

  /*Widget buildExpPanel () {
    ExpansionPanelList(expansionCallback: (int index, bool isExpanded) {
      setState(() {
        daysList[index].isExpanded =!daysList[index].isExpanded;
      });
    },
      children: daysList.map<Days>((Days item) {
        return ExpansionPanel( headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
              title: Text(daysList.dzien_tygodnia),
            );
          },
          body: ListTile(
            title: Text('Item 1 child'),
            subtitle: Text('Details goes here'),
          ),
        );
      }),
    );
  }*/

  Widget list() {
    return (ListView.builder(
      itemCount: daysList.length,
      itemBuilder: (context, index) {
        final days = daysList[index];
        return Card(
          child: ListTile(
            onTap: () {},
            title: Text(days.dzien_tygodnia),
          ),
        );
      },
    )
    );
  }

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