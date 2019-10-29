import 'package:flutter/material.dart';
import 'package:flutter_essential/pages/section_5/login_api.dart';
import 'package:flutter_essential/pages/section_5/login_page_s5.dart';
import 'package:flutter_essential/utils/nav.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //O SafeArea (área segura) permite que o layout do seu aplicativo seja desenhado corretamente dentro do espaço disponível na tela.:
    return SafeArea(
      // Utilizado para colocarmos o menu lateral no AppBar. Define automaticamente o tamanho:
      child: Drawer(
        child: ListView(
          children: <Widget>[
            //O widget UserAccountsDrawerHeader é utilizado para criar o header do menu lateral.
            UserAccountsDrawerHeader(
              accountName: Text("Gabriel Alves"),
              accountEmail: Text("ogalvesg@gmail.com"),
              currentAccountPicture: CircleAvatar(
                //backgroundImage: NetworkImage("link da imagem"), //Pega a imagem da net
                backgroundImage:
                    AssetImage("assets/images/eu.jpg"), //Pega a imagem do asset
              ),
            ),
            SizedBox(
              height: 8,
            ),
//          FlutterLogo(
//            size: 64,
//          ),
            //O ListTile é um widget que facilita a criação de items dentro de uma lista, pois ele possui um título, descrição e a
            // possibilidade de adicionar elementos na esquerda (leading) e direita (trailing).
            ListTile(
              onTap: () {
                print("ListTile: Favorite");
                Navigator.pop(context);
              },
              leading: Icon(Icons.favorite),
              title: Text("Favorites"),
              subtitle: Text("More informations..."),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: () {
                print("ListTile: Help");
                Navigator.pop(context);
              },
              leading: Icon(Icons.help),
              title: Text("Help"),
              subtitle: Text("More informations..."),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: () => _onClickLogout(context),
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              //subtitle: Text("More informations..."),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    print("ListTile: Logout");
    Navigator.pop(context);
    push(context, LoginPageS5(), replace: true);
  }
}
