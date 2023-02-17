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
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple).copyWith(secondary: Colors.amber),
          useMaterial3: true
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false ,
    );
  }
}

