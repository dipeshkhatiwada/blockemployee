import 'package:flutter/material.dart';
import 'src/HomePage.dart';

void main()=> runApp(MyApp());
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Block',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false, 
      // remove  flutter banner at top right
      home: HomePage(),
    );
  }
}