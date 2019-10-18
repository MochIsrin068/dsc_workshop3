import 'package:flutter/material.dart';
import 'package:moviecatalogue_api/screens/home_screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xffF6F7F9),
            body: HomeScreen(),
          ),
        ));
  }
}
