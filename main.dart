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
        useMaterial3:  true,
        colorSchemeSeed: Colors.purple,
        shadowColor: Colors.grey[700]
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false ,
    );
  }
}

