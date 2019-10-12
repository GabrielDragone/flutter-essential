import 'dart:async';

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
        child: _button(),
      ),
    );
  }

  _button() {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        "Olá, mundo!",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () => _onClickOk(),
    );
  }

  void _onClickOk() => print("Olá");

  _image() {
    return Image.asset(
      "assets/images/dog4.png",
      fit: BoxFit.contain,
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

//Explicações:
// Child: Utilizados por Widgets que suportam apenas 1 filho, exemplo CENTER.
// Childres: Utilizados por Widgets que podem receber mais de um filho, exemplo ListView.

//Atalhos:
// Cntrl + Alt + M = Cria um method utilizando seleção feita pelo dev.
// Cntrl + Alt + L = Auto indent

//Imagens:
// Para utilizar as imagens do assets, editar em pubspec.yaml:
/*  # To add assets to your application, add an assets section, like this:
  assets:
    - assets/images/ #para utilizar as imagens do assets
* */
//fit: pra dimensionar as imagens
//SizedBox.expand: Preenche toodo o espaço do container pai pra ocupar a imagem na tela inteira, vai no lugar do center, dps utilizar fit

//RaisedButton:
// Sempre colocar o onPressed(). E esse dentro desse estiver null, o botão fica desabilitado.
// A descrição do botão sempre irá dentro de um child: Text("Botão").

//Collumn e Row:
// Column: Vertical ou em baixo do outro.
// Row: Horizontalmente, lado a lado.
// Ambos vão no lugar do Center e tem children (filhos).
//MainAxisSize: Define o tamanho da coluna ou linha,

//MainAxisAlignment:
// Alinha a coluna ou linha no eixo principal.
// Define onde os childrens ficaram posicionados, variando entre start(padrão), center ou end.

//CrossAxisAlignment:
// Alinha a coluna ou linha no eixo cruzado.
