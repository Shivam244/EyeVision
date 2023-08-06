import 'package:eyevision/screens/astig-chart-screen.dart';
import 'package:eyevision/screens/chart-screen.dart';
import 'package:eyevision/screens/login.dart';
import 'package:eyevision/screens/menu.dart';
import 'package:eyevision/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
