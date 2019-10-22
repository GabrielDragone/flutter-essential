import 'package:flutter/material.dart';
import 'package:flutter_essential/widgets/app_text.dart';
import 'package:flutter_essential/widgets/blue_button.dart';

class LoginPageS5 extends StatefulWidget {
  //Chave do formulário que controla seus estados:
  @override
  _LoginPageS5State createState() => _LoginPageS5State();
}

class _LoginPageS5State extends State<LoginPageS5> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController(text: "Gabriel");

  final _tSenha = TextEditingController(text: "123");

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projeto dos Carros"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    // Utilizado para armazenar os estados dos campos de texto e também chamar a validação:
    return Form(
      key: _formKey, //Chave do formulário que controla seus estados
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            //Text("Login"),
            AppText(
              "Login", "Digite seu login",
              tecController: _tLogin,
              validator: _validateLogin,
              keyboardType: TextInputType
                  .emailAddress, //Define o tipo de teclado que vai aparecer quando digitar no campo
              textInputAction: TextInputAction.next,
              nextFocus:
                  _focusSenha, //Define para onde vai quando clicado no TextInputAction
            ),
            //Text("Senha"),
            SizedBox(height: 16),
            AppText(
              "Senha",
              "Digite sua senha",
              boolPassword: true,
              tecController: _tSenha,
              validator: _validateSenha,
              focusNode: _focusSenha,
              keyboardType: TextInputType
                  .number, //Define o tipo de teclado que vai aparecer quando digitar no campo
            ),
            SizedBox(height: 16),
            BlueButton(
              "Login",
              onPressed: () => _onClickLogin(),
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogin() {
    //Valida todos os campos de TextFormField pra verificar se estão preenchidos.
    // Necessário ter o validator em todos os TextFormFields
    bool formOk = _formKey.currentState.validate();

    //Se não estiver ok, sai do método:
    if (!formOk) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login - Senha: $senha");
  }

  String _validateLogin(String strText) {
    if (strText.isEmpty) {
      return "Digite o login!";
    }
    return null;
  }

  String _validateSenha(String strSenha) {
    if (strSenha.isEmpty) {
      return "Digite a senha!";
    }

    if (strSenha.length < 5) {
      return "A senha deve conter pelo menos 5 dígitos!!";
    }

    return null;
  }

  //Utilizado para gerenciar memória da tela:
  @override
  void dispose() {
    super.dispose();
  }
}

////////////////////////////////////////////////////////////////////////////////
//                            Explicações:                                    //
////////////////////////////////////////////////////////////////////////////////
// As explicações aqui contidas, são referentes à Sessão 5: Projeto dos Carros.
// Named Arguments: são argumentos/parâmetros não obrigatórios. Exemplo: {bool password = false}
// @required: são argumentos/parâmetros obrigatórios. Exemplo: {@required bool password = false}
