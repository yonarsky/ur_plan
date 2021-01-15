import 'package:flutter/material.dart';
import 'database_provider.dart';
import 'college.dart';

String id;
int year;
String nameCourse;

class Course extends StatefulWidget {
  Course({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _CourseState createState() => _CourseState();

}

class _CourseState extends State<Course> {

  String name = courseName;

  bool isLoading;
  List<Subjects> yearsList = new List();


  void fetchYears(courseId) async {
    setState(() => isLoading = true);
    final tmpList = await DatabaseProvider.db.getYears(courseId);
    setState(() {
      isLoading = false;
      yearsList = tmpList;
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchYears(courseId);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(name),
          centerTitle: true,
          elevation: 0,
        ),
        body: isLoading ? ListView.builder(
          itemCount: yearsList.length,
          itemBuilder: (context, index) {
            final years = yearsList[index];
            return Card(
              child: ListTile(
                onTap: () {
                  id = courseId;
                  year = years.rok;
                  nameCourse = name;
                  Navigator.pushNamed(context, '/timetable');
                },
                title: Text("Rok " + years.rok.toString()),
              ),
            );
          },
        ) : Center(child: CircularProgressIndicator())
    );
  }
}
