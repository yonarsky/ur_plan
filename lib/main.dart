import 'package:flutter/material.dart';
import 'home.dart';
import 'college.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => MyHomePage(),
    '/college': (context) => College(),
  },
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
));
