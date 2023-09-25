import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/InputPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.light().copyWith(
          primary: const Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const MyHomePage(),
    );
  }
}
