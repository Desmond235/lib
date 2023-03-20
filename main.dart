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
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.black45
          .withOpacity(0.8),
          secondary: Colors.amber
        ),
        shadowColor: Colors.grey[700],
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleSmall: const TextStyle(
            fontFamily: 'OpenSans', 
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        
        appBarTheme: AppBarTheme(
            titleTextStyle: ThemeData.light().textTheme.copyWith(
                  titleSmall: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold
                  )
            ).bodyLarge
        ),
        
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
