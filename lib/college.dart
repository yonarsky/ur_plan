import 'package:flutter/material.dart';
import 'griddashboard.dart';


class College extends StatefulWidget {
  College({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _CollegeState createState() => _CollegeState();
}

class _CollegeState extends State<College> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(collegeName),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Text('x'),
        ],
      ),
    );
  }
}
