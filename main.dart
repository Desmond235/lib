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
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
        shadowColor: Colors.grey[700],
        fontFamily: 'QuickSand',
        appBarTheme: AppBarTheme(
            titleTextStyle: ThemeData.light().textTheme.copyWith(
                  titleSmall: const TextStyle(
                    fontFamily: 'Open sans',fontSize: 20 
                  )
            ).bodySmall
        ),
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
