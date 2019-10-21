import 'package:flutter/material.dart';
import 'package:flutter_essential/pages/hello_gridview.dart';
import 'package:flutter_essential/pages/hello_listview.dart';
import 'package:flutter_essential/pages/hello_page2.dart';
import 'package:flutter_essential/pages/hello_page3.dart';
import 'package:flutter_essential/utils/nav.dart';
import 'package:flutter_essential/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'drawer_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //DefaultTabController: Serve para inserir tab's na tela:
    return DefaultTabController(
      length: 3, //Quantidade de tabs que haverão na tela.
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello Flutter",
          ),
          centerTitle: true,
          //Onde são definidas as descrições do tab:
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.looks_one)),
              Tab(icon: Icon(Icons.looks_two)),
              Tab(icon: Icon(Icons.looks_3)),
            ],
          ),
        ),
        //Cada elemento relaciona com um body:
        body: TabBarView(
          children: <Widget>[
            _body(context),
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.green,
            ),
          ],
        ),
        floatingActionButton: _floatActionButton(),
        //Menu Lateral, exemplo com método que fiz na tela:
        //drawer: _drawer(),
        //Exemplo com classe que o professor fez:
        drawer: DrawerList(),
      ),
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
          _text("Page View Example. Roll >>:"),
          _pageView(),
          //Está sendo passado o context pra utilizar na Navigation:
          //_buttons(context),
          //Não está mais passando context, pois definimos abaixo no Builder:
          _buttons(),
        ],
      ),
    );
  }

  //Menu Lateral:
  _drawer() {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Drawer example"),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: Text("Hello Drawer"),
          ),
        ),
      ),
    );
  }

  //Cria os botões flutuantes:
  _floatActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          heroTag: "fab1",
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: () {
            _onClickFab("FAB Example: Clicked on Add");
          },
        ),
        SizedBox(
          width: 8,
        ),
        FloatingActionButton(
          heroTag: "fab2",
          child: Icon(Icons.favorite),
          backgroundColor: Colors.red,
          onPressed: () {
            _onClickFab("FAB: Clicked on Fav");
          },
        ),
      ],
    );
  }

  //Carroussel:
  _pageView() {
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
  //_buttons(context) {

  //Não está mais passando context, pois definimos abaixo no Builder:
  _buttons() {
    //Criado Builder para passar context para a SnackBar:
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Row(
              //Deixa os espaços igualmente entre os botões:
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton("GridView",
                    onPressed: () =>
                        _onClickNavigator(context, HelloGridView())),
                BlueButton("Page 2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page 3",
                    onPressed: () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              //Deixa os espaços igualmente entre os botões:
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Exemplo pra se utilizar com methods que não tem parâmetros:
                //BlueButton("Snack", onPressed: _onClickSnack),
                //Exemplo pra se utilizar com methods que tem parâmetros:
                BlueButton("Snack", onPressed: () => _onClickSnack(context)),
                BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
                BlueButton("Toast", onPressed: _onClickToast),
              ],
            )
          ],
        );
      },
    );
  }

  //OLD:
//  _buttons(context) {
//    return Column(
//      children: <Widget>[
//        Row(
//          //Deixa os espaços igualmente entre os botões:
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            _button(
//                //Quando existem parâmetros a serem passados nos métodos, utilizar a sintaxe abaixo com seta:
//                context,
//                "ListView",
//                () => _onClickNavigator(context, HelloPage1())),
//            _button(context, "Page 2",
//                () => _onClickNavigator(context, HelloPage2())),
//            _button(context, "Page 3",
//                () => _onClickNavigator(context, HelloPage3())),
//          ],
//        ),
//        Row(
//          //Deixa os espaços igualmente entre os botões:
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            _button(context, "Snack", _onClickSnack),
//            _button(context, "Dialog", _onClickDialog),
//            _button(context, "Toast", _onClickToast),
//          ],
//        )
//      ],
//    );
//  }

  //Está sendo passado o context pra utilizar na Navigation:
  _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);

    if (s != null) {
      print(s);
    } else {
      print("nothin to show!");
    }
  }

  //SnackBar: Aparece uma mensagem no canto inferior da tela com uma singleAction. Para utilizarmos esse Widget, precisamos passar um context:
  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("SnackBar Example"),
        action: SnackBarAction(
          label: "Ok",
          onPressed: () {
            print("SnackBar: Teste Snack");
          },
        ),
      ),
    );
  }

  //Dialog: Apresenta um alerta no centro da tela:
  _onClickDialog(BuildContext context) {
    showDialog(
      context: context,
      //Faz com que não permita que feche o Dialog se o usuário clicar fora do mesmo. Geralmente vem true:
      barrierDismissible: false,
      builder: (context) {
        //WillPopScope: Não deixa o usuário fechar o Dialog sem utilizar as opções definidas no action:
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("AlertDialog Example"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                  print("Alert Dialog: Clicked on OK button");
                },
              ),
            ],
          ),
        );
      },
    );
  }

  //Toast:
  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Toast Example",
        toastLength: Toast.LENGTH_SHORT, //Tempo de exibição para o Android
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1, //Tempo de exibição para o iPhone
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  //Exemplo do FloatActionButton:
  _onClickFab(String strMsg) {
    print(strMsg);
  }

  //Está sendo passado o context pra utilizar na Navigation:
  /*_button(BuildContext context, String strText, Function onPressed) {
    return BlueButton(strText, onPressed);
  }*/

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
          fontSize: 25,
          color: Colors.blue,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
//                            Atalhos:                                        //
////////////////////////////////////////////////////////////////////////////////
// Cntrl + Alt + M = Cria um method utilizando seleção feita pelo dev.
// Cntrl + Alt + L = Auto indent
// Alt + Enter nas palavras, para verificar ajudas.
// Cntrl + P nos Widgets pra verificar os atributos dos Widget.

////////////////////////////////////////////////////////////////////////////////
//                            Dicas:                                          //
////////////////////////////////////////////////////////////////////////////////
// Site do Flutter: https://flutter.dev/
// Site de Packages: https://pub.dev/

////////////////////////////////////////////////////////////////////////////////
//                            Explicações:                                    //
////////////////////////////////////////////////////////////////////////////////
//StatelessWidget: Widget que não mantém estados.
//StatefulWidget: Widget que mantém estados, utilizados para redesenhar a página de acordo com dados inseridos.
//  Utiliza-se o setState(){ variavel = valor}, pra atualizar a variável e redesenhar tela. Exemplo: hello_listview

//MaterialDesigner:
// O Material Design é um padrão de interface criado pelo Google.

//Scaffold:
// O Scaffold é um widget que permite adicionar elementos do Material Design de forma simples, como a App Bar, Tabs, Navigation Drawer (menu lateral), Floating Action Button (FAB), etc.

//AppBar:
// Deve estar dentro de Scaffold, define a barra superior, junto com seu titulo, ações, drawer, etc.
// Para definirmos os botões que vão na AppBar, devemos utilizar o atributo actions. Exemplos na hello_listview.

//Text / TextStyle:
// Widget pra inserir textos e editar o mesmo.

// Child: Utilizados por Widgets que suportam apenas 1 filho, exemplo CENTER.
// Childres: Utilizados por Widgets que podem receber mais de um filho, exemplo ListView.

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
// Column: Vertical ou em baixo do outro. Espeficar sempre o height, pois o column não consegue adivinhar o mesmo.
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

//Navigator.push:
// Utilizado para navegar entre páginas passando context.

//Navigator.pop:
// Voltar pra tela anterior. Exemplo na hello_page2

//Expanded:
// Vai no lugar do container, utilizado pra preencher espaços disponíveis. Definindo através de peso (flex) a quantidade que cada
// ocupará no layout.

//ListView:
// Retorna uma lista de algo.
// itemExtent: define um tamanho fixo pras células da ListView, ver exemplo em hello_listview.dart
// .builder: Utilizado pra fazer um ListView dinâmico.

//Stack:
// Utilizado para colocar um Widget em cima do outro, como se fossem pilhas.
// Caso queira alterar onde o texto está posicionado dentro da Stack, utilizar um Container e definir o alignment.
// IMPORTANTE: Quando trabalhamos com Stack, Container, etc, ou seja, não trabalhamos com botões, então não temos o evento
//    onPressed(), dessa forma, teremos que envolver esses Widgets com o Widget GestureDetector.

//BoxDecoration:
// Utilizado para decorar o visual de um Container. Envolver o Widget que deseja decorar com um Container.

//GridView:
// Funciona como se fosse uma listview, só que podemos fazer com que essa tenha mais de 1 coluna. Verificar exemplo na page hello_gridview.

//GestureDetector:
// Quando trabalhamos com Widgets que não são botões, esse cara que vai ser responsável pelos assionamento dos eventos.

//Builder:
// Podemos utilizá-lo para criar um context se em algum momento não tivermos o mesmo.

//Alertas:
// SnackBar.
// Dialog.
// Toast.

//SnackBar:
// O Snack é um tipo de alerta muito comum no Material Design.
// Fornece uma mensagem no canto inferior da tela, disponibilizando uma singleAction (apenas uma opção de ação).
// Precisa fornecer um contexto que está dentro de Scaffold(ou outro Widget que está no body), não o que vem da tela principal, que é definido automaticamente.
// Para isso, foi criado um Builder dentro de _buttons (pois está dentro de Scaffold).
// Exemplos na home_page.

//showDialog(AlertDialog):
// Apresenta mensagem na tela um Alerta.
// Exemplos: Cancelar ou confirmar, mostrar lista de opções pro usuário escolher, mostrar datas pra escolher, etc.
// Definidas as actions, todas devem ter o Navigator.pop pra voltar pra tela.
// Exemplos na home_page.

//WillPopScope:
// Faz com que o usuário não consiga fechar a tela usando o Voltar (botão do celular), sem entrar em um evento que chame o Navigator.pop.
// Utilizado junto com o showDialog. Verificar exemplo.

//Toast:
// Alerta temporário que mostra no centro de tela.
// Um alerta, só que não disponibiliza botões para interagir. O mesmo some sozinho de acordo com o que está definido
//   em seus parâmetros.
// Para utilizarmos, precisamos importar o package que pode ser pego através do site https://pub.dev/, declarar no pubspec e importar na tela.
// Exemplo na home_page.

//FloatingActionButton (FAB):
// O Floating Action Button (FAB) é um botão flutuante que é utilizado no Material Design para chamar a atenção do usuário para uma ação importante do aplicativo.
// Vai junto com os atributos de Scaffold.
// Pode ser declarado como Widget (Collumn, Row, pra ter children mais de 1) ou FloatingActionButton;
// Exemplo na home_page.

//SizedBox:
// Utilizamos para dar espaços visual entre Widgets.
// Exemplo na home_page.

//Drawer:
// Utilizado para colocarmos o menu lateral no AppBar.
// Exemplo na home_page e na drawer_list com ListTile.

//ListTile:
// O ListTile é um widget que facilita a criação de items dentro de uma lista, pois ele possui um título, descrição e a
// possibilidade de adicionar elementos na esquerda (leading) e direita (trailing).
// Exemplo em drawer_list.

//UserAccountsDrawerHeader:
//O widget UserAccountsDrawerHeader é utilizado para criar o header do menu lateral.
// Exemplo em drawer_list.

//CircleAvatar:
// Imagem com borda arredondada.
// Exemplo em drawer_list.

//SafeArea:
//O SafeArea (área segura) permite que o layout do seu aplicativo seja desenhado corretamente dentro do espaço disponível na tela.:
// Exemplo em drawer_list.

//Tabs:
// Tabs sem dúvida é um dos padrões de interface mais utilizados nos aplicativos. No flutter, as tabs são criadas com os widgets
//  TabBar e TabBarView.
// São definidos no bottom do AppBar.
// Devemos envolver o Widget principal da tela(Scaffold) com o widget DefaultTabController e definir seu tamanho (length).
// E dentro do body, colocar o Widget TabBarView junto com os childres na mesma quantidade do lenght.
// Exemplo na home_page:
