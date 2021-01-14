import 'package:flutter/material.dart';
import 'griddashboard.dart';
import 'database_provider.dart';

class College extends StatefulWidget {
  College({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _CollegeState createState() => _CollegeState();

}

class _CollegeState extends State<College> {

  List<Course> courses = [
    Course(name: 'Informatyka', id: '1'),
    Course(name: 'Matematyka', id: '2'),
    Course(name: 'Mechatronika', id: '3'),
    Course(name: 'Finanse i rachunkowość', id: '4')
  ];

  bool isLoading;
  List<Days> daysList = new List();


  void fetchDays() async {
    setState(() => isLoading = true);
    final tmpList = await DatabaseProvider.db.getAllDays();
    setState(() {
      isLoading = false;
      daysList = tmpList;
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchDays();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(collegeName),
        centerTitle: true,
        elevation: 0,
      ),
      body: isLoading ? ListView.builder(
        itemCount: daysList.length,
        itemBuilder: (context, index) {
          final day = daysList[index];
          return Card(
              child: ListTile(
                onTap: () {},
                title: Text(day.dzien_tygodnia),
                subtitle: Text("xd"),
              ),
            );
          },
      ) : Center(child: CircularProgressIndicator())
    );
  }
}

class Course {
  String name;
  String id;
  Course({this.name, this.id});
}
