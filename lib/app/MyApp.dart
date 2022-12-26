
import 'package:advance_fluuter_project/resources/routes_manager.dart';
import 'package:advance_fluuter_project/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); //private named Constructor

   int count = 0;

  static final MyApp instance = MyApp._internal();// Single instance == Singleton

  factory MyApp() => instance;//factory  for the class instance
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
