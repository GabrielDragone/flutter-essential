import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Carro {
  String strNome;
  String strFoto;

  Carro(this.strNome, this.strFoto);
}

class HelloGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    List<Carro> carros = [
      Carro("Ferrari",
          "http://pluspng.com/img-png/ferrari-png-png-file-name-ferrari-624.png"),
      Carro("Lamborghini",
          "http://pngimg.com/uploads/lamborghini/lamborghini_PNG10710.png"),
      Carro("Tesla",
          "https://www.stickpng.com/assets/images/5a5218d02f93c7a8d5137f9a.png"),
      Carro("Aston Martins",
          "https://www.stickpng.com/assets/images/580b585b2edbce24c47b2c10.png"),
      Carro("Porshe", "http://pngimg.com/uploads/porsche/porsche_PNG10608.png"),
      Carro("New Beetle",
          "https://banner2.kisspng.com/20171201/7c5/white-volkswagen-beetle-png-car-image-5a2193553fe265.7229380415121498452617.jpg"),
      Carro("Golf GTI",
          "https://banner2.kisspng.com/20180326/xjw/kisspng-volkswagen-passat-car-volkswagen-golf-gti-volkswag-golf-5ab8a9cbed2cf9.9305302115220515319715.jpg"),
      Carro("Parati GOD",
          "https://http2.mlstatic.com/tanque-de-gol-saveiro-quadrado-voyage-parati-7607-D_NQ_NP_553415-MLB25242884275_122016-F.jpg"),
    ];

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                2), //Esse atributo define a quantidade de colunas que a Grid View vai ter:
        itemCount: carros.length, //Define o tamanho da gridView
        itemBuilder: (BuildContext context, int index) {
          //Recupera o objeto carro:
          Carro carro = carros[index];

          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _image(carro.strFoto),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    carro.strNome,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          );
        });
  }
}

_image(String strPath) {
  return Image.network(
    strPath,
    fit: BoxFit.contain,
  );
}
