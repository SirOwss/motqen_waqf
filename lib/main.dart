import 'package:flutter/material.dart';
import 'package:motqen_waqf/screens/analysis_session.dart';
import 'package:motqen_waqf/screens/choose_rewaya.dart';
import 'package:motqen_waqf/screens/choose_section.dart';
import 'package:motqen_waqf/screens/home_screen.dart';
import 'package:motqen_waqf/screens/plan_home.dart';
import 'package:motqen_waqf/screens/reports.dart';
import 'package:motqen_waqf/screens/review_session.dart';
import 'package:motqen_waqf/screens/session.dart';
import 'package:motqen_waqf/screens/session_home.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: "IBM")
      ),
      home: Plans(),
      routes: {
        '/rewaya': (context) => ChooseRewaya(),
        '/section': (context) => ChooseSection(),
        '/session':(context) => StartSession(),
        '/reviewafter':(context)=> ReviewAfterSession(),
        '/plan':(context)=> Plans(),
        '/analysis':(context)=> AnalysisSession(),
        '/report':(context)=> Reports(),
        '/homeSession':(context)=>SessionHome(),
        '/home':(context)=>HomeScreen()
      },
    );
  }
}
