import 'package:flutter/material.dart';
import 'package:flutter_essential/utils/nav.dart';
import 'package:flutter_essential/widgets/blue_button.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Navigator Pop:"),
          BlueButton(
            "Voltar",
            onPressed: () => onClickVoltar(context),
          ),
        ],
      ),
    );
  }

  onClickVoltar(context) {
    pop(context, strRetorno: "Navigator pop from Page 2");
  }
}
