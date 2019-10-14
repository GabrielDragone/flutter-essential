import 'package:flutter/material.dart';
import 'package:flutter_essential/utils/nav.dart';
import 'package:flutter_essential/widgets/blue_button.dart';

class HelloPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: BlueButton(
        "Voltar",
        onPressed: () => onClickVoltar(context),
      ),
    );
  }

  onClickVoltar(context) {
    //return Navigator.pop(context, "Navigator pop from Page 3");
    pop(context, strRetorno: "Navigator pop from Page 3");
  }
}
