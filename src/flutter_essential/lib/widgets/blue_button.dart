import 'package:flutter/material.dart';

//Classe genérica para criação de botões no mesmo padrão:
class BlueButton extends StatelessWidget {
  String strText;
  Function onPressed;
  Color color;

  BlueButton(this.strText,
      {@required this.onPressed, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      child: Text(
        strText,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
