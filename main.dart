import 'package:flutter/material.dart';
import 'widgets/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // ignore: deprecated_member_use
        accentColor: Colors.amber,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false ,
    );
  }
}

