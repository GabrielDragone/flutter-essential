import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  //Variáveis:
  String strLabel;
  String strHint;
  bool boolPassword;
  TextEditingController tecController;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;

  //Método constructor. Named arguments opcionais entre {}:
  AppText(
    this.strLabel,
    this.strHint, {
    this.boolPassword = false,
    this.tecController,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: tecController, //Responsável por validar o campo preenchido.
      obscureText:
          boolPassword, //Valida se o campo é de password para ocultar o mesmo.
      validator:
          validator, //Responsável por validar se os campos estão digitados. Cada campo terá uma validação.
      keyboardType:
          keyboardType, //Define o tipo de teclado que vai aparecer quando digitar no campo
      keyboardAppearance: Brightness.dark, //define a aparência do teclado
      textInputAction:
          textInputAction, //Define aquele botão ao lado do teclado para ser utilizado com alguma ação
      focusNode: focusNode, //Define para qual campo será definido o focus
      onFieldSubmitted: (String strText) {
        //Define a ação do botão "next" e foca no FocusNode passado por parâmetro
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      style: TextStyle(
        fontSize: 25,
        color: Colors.blue,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        labelText: strLabel,
        labelStyle: TextStyle(
          fontSize: 25,
          color: Colors.grey,
        ),
        hintText: strHint,
        hintStyle: TextStyle(fontSize: 16),
      ),
    );
  }
}
