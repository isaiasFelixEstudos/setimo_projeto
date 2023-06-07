import 'package:flutter/material.dart';
import 'app/homeScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (_) => HomeScreen(),
      },
    ),
  );
}
