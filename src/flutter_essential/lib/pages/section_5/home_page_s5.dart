import 'package:flutter/material.dart';
import 'package:flutter_essential/widgets/drawer_list.dart';

class HomePageS5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        centerTitle: true,
      ),
      drawer: DrawerList(),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Text("Olá, Mundo!"),
    );
  }
}
