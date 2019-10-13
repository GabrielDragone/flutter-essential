import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_essential/pages/hello_page1.dart';
import 'package:flutter_essential/pages/hello_page2.dart';
import 'package:flutter_essential/pages/hello_page3.dart';

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
      body: _body(context),
    );
  }

  //Método criado para facilitar visualização e montar o body:
  //Está sendo passado o context pra utilizar na Navigation:
  _body(context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _text("Page View Example. Roll:"),
            _pageView(),
            _buttons(context),
          ],
        ));
  }

  //Carroussel:
  Container _pageView() {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _image("assets/images/dog1.png"),
          _image("assets/images/dog2.png"),
          _image("assets/images/dog3.png"),
          _image("assets/images/dog4.png"),
          _image("assets/images/dog5.png"),
        ],
      ),
    );
  }

  //Está sendo passado o context pra utilizar na Navigation:
  _buttons(context) {
    return Column(
      children: <Widget>[
        Row(
          //Deixa os espaços igualmente entre os botões:
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button(
                //Quando existem parâmetros a serem passados nos métodos, utilizar a sintaxe abaixo com seta:
                context,
                "ListView",
                () => _onClickNavigator(context, HelloPage1())),
            _button(context, "Page 2",
                () => _onClickNavigator(context, HelloPage2())),
            _button(context, "Page 3",
                () => _onClickNavigator(context, HelloPage3())),
          ],
        ),
        Row(
          //Deixa os espaços igualmente entre os botões:
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button(context, "Snack", _onClickSnack),
            _button(context, "Dialog", _onClickDialog),
            _button(context, "Toast", _onClickToast),
          ],
        )
      ],
    );
  }

  //Está sendo passado o context pra utilizar na Navigation:
  _onClickNavigator(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  _onClickSnack() {}

  _onClickDialog() {}

  _onClickToast() {}

  //Está sendo passado o context pra utilizar na Navigation:
  _button(BuildContext context, String strText, Function onPressed) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        strText,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
    );
  }

  _image(String strPath) {
    return Image.asset(
      strPath,
      fit: BoxFit.contain,
    );
  }

  //Método criado para facilitar visualização e montar o Text:
  _text(String strText) {
    return Text(
      strText,
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
//Scaffold:
// O Scaffold é um widget que permite adicionar elementos do Material Design de forma simples, como a App Bar, Tabs, Navigation Drawer (menu lateral), Floating Action Button (FAB), etc.

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

//PageView:
//O PageView é um widget que recebe um array de widgets filhos e cria o famoso carrossel.

//Pading:
// O padding é utilizado para criar um espaçamento dentro do widget. É possível aplicar o padding de 2 maneiras:
// 1 - Utilizar o widget Container e dentro dele configurar o atributo padding
// 2 - Utilizar o widget Padding.

//Scroll básico - SingleChildScrollView:
// O ListView é um dos widgets mais utilizados e é utilizado para criar listas com rolagem.

//Navigator:
// Utilizado para navegar entre páginas passando context.
