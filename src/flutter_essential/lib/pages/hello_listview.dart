import 'package:flutter/material.dart';

class Dog {
  String strNome;
  String strFoto;

  //Constructor:
  Dog(this.strNome, this.strFoto);
}

class HelloListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    //Declarando uma lista de Imagem com os conteúdos dentro:
    /*List<Image> imgs = [
      _image("assets/images/dog1.png"),
      _image("assets/images/dog2.png"),
      _image("assets/images/dog3.png"),
      _image("assets/images/dog4.png"),
      _image("assets/images/dog5.png"),
    ];*/
    List<Dog> dogs = [
      Dog("Catiorineo 1", "assets/images/dog1.png"),
      Dog("Catiorineo 2", "assets/images/dog2.png"),
      Dog("Catiorineo 3", "assets/images/dog3.png"),
      Dog("Catiorineo 4", "assets/images/dog4.png"),
      Dog("Catiorineo 5", "assets/images/dog5.png"),
      Dog("Catiorineo 6", "assets/images/dog1.png"),
    ];

    //Cria a lista de acordo com o array declarado acima:
    return ListView.builder(
        //Informa o tamanho da ListView:
        itemCount: dogs.length,
        itemExtent: 350,
        //Dica verificar definição de itemBuilder e IndexedWidgetBuilder dentro do mesmo, pra pegar o contexto abaixo:
        itemBuilder: (BuildContext context, int index) {
          //Recupera o objeto catioro:
          Dog dog = dogs[index];

          //return dogs[index];
          return _image(dog.strFoto);
        });
  }

  _image(String strPath) {
    return Image.asset(
      strPath,
      fit: BoxFit.cover,
    );
  }
}
