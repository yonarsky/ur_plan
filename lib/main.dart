import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'griddashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plan zajęć UR',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: MaterialColor(
            Colors.blue.shade900.value,
            {
              50: Colors.blue.shade50,
              100: Colors.blue.shade100,
              200: Colors.blue.shade200,
              300: Colors.blue.shade300,
              400: Colors.blue.shade400,
              500: Colors.blue.shade500,
              600: Colors.blue.shade600,
              700: Colors.blue.shade700,
              800: Colors.blue.shade800,
              900: Colors.blue.shade900
            }
        ),
        accentColor: Colors.blue[900],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: MaterialColor(
            Colors.blue.shade900.value,
            {
              50: Colors.blue.shade50,
              100: Colors.blue.shade100,
              200: Colors.blue.shade200,
              300: Colors.blue.shade300,
              400: Colors.blue.shade400,
              500: Colors.blue.shade500,
              600: Colors.blue.shade600,
              700: Colors.blue.shade700,
              800: Colors.blue.shade800,
              900: Colors.blue.shade900
            }
        ),
        accentColor: Colors.blue[900],
      ),
      home: MyHomePage(title: 'Plan zajęć UR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
