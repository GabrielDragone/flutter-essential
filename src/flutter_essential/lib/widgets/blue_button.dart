import 'package:flutter/material.dart';

//Classe genérica para criação de botões no mesmo padrão:
class BlueButton extends StatelessWidget {
  String strText;
  Function onPressed;
  Color color;

  bool showProgress;

  BlueButton(this.strText,
      {@required this.onPressed,
      this.color = Colors.blue,
      this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: color,
        child: showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                strText,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
        onPressed: onPressed,
      ),
    );
  }
}
