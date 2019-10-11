import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello Flutter",
        ),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  //Método criado para facilitar visualização e montar o body:
  _body() {
    return Container(
      color: Colors.white,
      child: Center(
        child: _text(),
      ),
    );
  }

  //Método criado para facilitar visualização e montar o Text:
  _text() {
    return Text(
      "Hello, world!",
      style: TextStyle(
          fontSize: 30,
          color: Colors.blue,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
}
