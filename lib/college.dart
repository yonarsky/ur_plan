import 'package:flutter/material.dart';
import 'griddashboard.dart';


class College extends StatefulWidget {
  College({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _CollegeState createState() => _CollegeState();
}

class _CollegeState extends State<College> {

  /*void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Plan zajęć UR'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}
