import 'package:eyevision/screens/astig-chart-screen.dart';
import 'package:eyevision/screens/chart-screen.dart';
import 'package:eyevision/screens/login.dart';
import 'package:eyevision/screens/menu.dart';
import 'package:eyevision/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

final ThemeData newTheme = ThemeData(
  primaryColor: Colors.deepPurple, 
  scaffoldBackgroundColor: Colors.grey[100],
  appBarTheme: AppBarTheme(
    color: Colors.deepPurple,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.deepPurple,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    shadowColor: Colors.grey.shade300,
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
);


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eye Vision',
      theme: newTheme,
      initialRoute: '/splash',
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginPage(),
        '/menu': (context) =>  MenuPage(),
        // '/chart': (context) =>  ChartScreen(image: ''),
        '/astig': (context) =>  AstigChartScreen(),
        '/splash': (context) =>  const SpalshScreen(),
      },
    );
  }
}

