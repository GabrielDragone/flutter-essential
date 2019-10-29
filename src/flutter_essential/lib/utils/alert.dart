import 'package:flutter/material.dart';

alert(BuildContext context, String strTitulo, String strMsg) {
  showDialog(
    context: context,
    //Faz com que não permita que feche o Dialog se o usuário clicar fora do mesmo. Geralmente vem true:
    barrierDismissible: false,
    builder: (context) {
      //WillPopScope: Não deixa o usuário fechar o Dialog sem utilizar as opções definidas no action:
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text(strTitulo),
          content: Text(strMsg),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
