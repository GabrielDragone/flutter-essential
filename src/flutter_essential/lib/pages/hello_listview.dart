import 'package:flutter/material.dart';

class Dog {
  String strNome;
  String strFoto;

  //Constructor:
  Dog(this.strNome, this.strFoto);
}

//Alterado pra Stateful, dica: selecionar StatelessWidget, alt + enter e mudar pra ful:
//class HelloListView extends StatelessWidget {
class HelloListView extends StatefulWidget {
  //Declaração de variável para utilizar no Estado:
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _boolGridView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _tittleDynamicText(),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                print("List");
                //Método que é chamado para redesenhar a tela e atualizá-la. Vem junto com a StatefulWidget:
                setState(() {
                  _boolGridView = false;
                });
              }),
          IconButton(
              icon: Icon(Icons.grid_on),
              onPressed: () {
                print("Grid");
                //Método que é chamado para redesenhar a tela e atualizá-la. Vem junto com a StatefulWidget:
                setState(() {
                  _boolGridView = true;
                });
              })
        ],
      ),
      body: _body(),
    );
  }

  //Define dinamicamente o title da página de acordo com valor da variavel:
  _tittleDynamicText() {
    if (_boolGridView) {
      return Text("GridView");
    } else {
      return Text("ListView");
    }
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

    //Valida a variável pra montar Grid ou List:
    if (_boolGridView) {
      return GridView.builder(
          //Informa o tamanho da GridView:
          itemCount: dogs.length,
          //Define em quantas colunas será apresentado:
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          //Dica verificar definição de itemBuilder e IndexedWidgetBuilder dentro do mesmo, pra pegar o contexto abaixo:
          itemBuilder: (BuildContext context, int index) {
            return _itemView(dogs, index);
          });
    } else {
      //Cria a lista de acordo com o array declarado acima:
      return ListView.builder(
          //Informa o tamanho da ListView:
          itemCount: dogs.length,
          itemExtent: 350,
          //Dica verificar definição de itemBuilder e IndexedWidgetBuilder dentro do mesmo, pra pegar o contexto abaixo:
          itemBuilder: (BuildContext context, int index) {
            return _itemView(dogs, index);
          });
    }
  }

  _itemView(List<Dog> dogs, int index) {
    //Recupera o objeto catioro:
    Dog dog = dogs[index];

    //return dogs[index];
    //return _image(dog.strFoto);

    //Stack funciona como se fosse uma pilha, pra colocar um widget em cima do outro:
    return Stack(
      fit: StackFit.expand, //Utilizado pra preencher toodo o espaço
      children: <Widget>[
        _image(dog.strFoto),
        //Começa a escrita do texto do nome do dog:
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              "Stack " + dog.strNome,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _image(String strPath) {
    return Image.asset(
      strPath,
      fit: BoxFit.cover,
    );
  }
}
