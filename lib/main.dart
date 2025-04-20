import 'package:flutter/material.dart';
import 'package:moniepointtest/dashboard.dart';
import 'package:moniepointtest/screens/home/home.dart';
import 'package:moniepointtest/screens/search/search.dart';

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
      home: Dashboard(),
    );
  }
}


