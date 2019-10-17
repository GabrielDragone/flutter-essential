import 'package:flutter/material.dart';

import 'hello_listview.dart';

class DogPage extends StatelessWidget {
  final Dog dog;

  //Quando criar a DogPage, obrigatóriamente teremos que passar o Objet Dog:
  DogPage(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.strNome),
      ),
      body: Image.asset(dog.strFoto),
    );
  }
}
