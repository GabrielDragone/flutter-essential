import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

//Onde o app se inicia, basicamente sempre será assim, chamando uma página que
//geralmente será a HomePage():
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //O atributo abaixo faz com que o banner de debug suma:
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        brightness:
            Brightness.light, //Define o modo do aplicativo, dark, light, etc.
        scaffoldBackgroundColor:
            Colors.white, //Define de modo geral as cores dos Scaffolds do app.
      ),
      home: HomePage(),
    );
  }
}
