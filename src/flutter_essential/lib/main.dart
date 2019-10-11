import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

//Onde o app se inicia, basicamente sempre será assim, chamando uma página que
//geralmente será a HomePage():
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomePage(),
    );
  }
}
