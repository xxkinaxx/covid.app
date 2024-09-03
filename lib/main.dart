import 'package:api_covid/ui/hoax_screen.dart';
import 'package:api_covid/ui/hospital_screen.dart';
import 'package:api_covid/ui/main_screen.dart';
import 'package:api_covid/ui/news_screen.dart';
import 'package:api_covid/ui/stat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/hoax' : (context) => HoaxScreen(),
        '/hospital' : (context) => HospitalScreen(),
        '/news' : (context) => NewsScreen(),
        '/stat' : (context) => StatScreen()
      },
    );
  }
}
