import 'package:flutter/material.dart';
import 'griddashboard.dart';


class College extends StatefulWidget {
  College({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _CollegeState createState() => _CollegeState();
}

class _CollegeState extends State<College> {

  List<Course> courses = [
    Course(name: 'Informatyka'),
    Course(name: 'Matematyka'),
    Course(name: 'Mechatronika'),
    Course(name: 'Finanse i rachunkowość')
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(collegeName),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: courses.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {},
                title: Text(courses[index].name),
              ),
            );
          },
      ),
    );
  }
}

class Course {
  String name;
  Course({this.name});
}
