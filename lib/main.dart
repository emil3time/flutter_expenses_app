import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // primaryColor: Colors.amber,
        // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle().copyWith(
              fontFamily: 'OpenSans',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      title: 'EXPENSES APP',
      home: HomeApp(),
    );
  }
}
