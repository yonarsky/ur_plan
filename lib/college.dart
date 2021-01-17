import 'package:flutter/material.dart';
import 'griddashboard.dart';
import 'database_provider.dart';

String courseId;
String courseName;

class College extends StatefulWidget {
  College({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _CollegeState createState() => _CollegeState();

}

class _CollegeState extends State<College> {
  String letter = collegeLetter;

  bool isLoading;
  List<Courses> coursesList = new List();


  void fetchCourses(String collegeLetter) async {
    setState(() => isLoading = true);
    final tmpList = await DatabaseProvider.db.getAllCourses(collegeLetter);
    setState(() {
      isLoading = false;
      coursesList = tmpList;
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchCourses(letter);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(collegeName),
        centerTitle: true,
        elevation: 0,
      ),
      body: isLoading ? ListView.builder(
        itemCount: coursesList.length,
        itemBuilder: (context, index) {
          final course = coursesList[index];
          return Card(
              child: ListTile(
                onTap: () {
                  courseId = course.id_kierunki;
                  courseName = course.nazwa_kierunku;
                  Navigator.pushNamed(context, '/course');
                  },
                title: Text(course.nazwa_kierunku),
              ),
            );
          },
      ) : Center(child: CircularProgressIndicator())
    );
  }
}