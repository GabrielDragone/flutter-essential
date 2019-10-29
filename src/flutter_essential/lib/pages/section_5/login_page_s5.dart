import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_essential/pages/section_5/api_response.dart';
import 'package:flutter_essential/pages/section_5/home_page_s5.dart';
import 'package:flutter_essential/pages/section_5/login_api.dart';
import 'package:flutter_essential/pages/section_5/usuario.dart';
import 'package:flutter_essential/utils/alert.dart';
import 'package:flutter_essential/utils/nav.dart';
import 'package:flutter_essential/widgets/app_text.dart';
import 'package:flutter_essential/widgets/blue_button.dart';

class LoginPageS5 extends StatefulWidget {
  @override
  _LoginPageS5State createState() => _LoginPageS5State();
}

class _LoginPageS5State extends State<LoginPageS5> {
  //Chave do formulário que controla seus estados:
  final _formKey = GlobalKey<FormState>();

  //Controladores dos TextFormFields da tela:
  final _tLogin = TextEditingController(text: "Gabriel");
  final _tSenha = TextEditingController(text: "123");

  //Utilizado para dar foco no campo:
  final _focusSenha = FocusNode();

  bool _showProgress = false;

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
              showProgress: _showProgress,
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    //Valida todos os campos de TextFormField pra verificar se estão preenchidos.
    // Necessário ter o validator em todos os TextFormFields
    bool formOk = _formKey.currentState.validate();

    //Se não estiver ok, sai do método:
    if (!formOk) {
      return;
    }

    //Faz o CircularProgressIndicator rodar:
    setState(() {
      _showProgress = true;
    });

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login - Senha: $senha");

    //Declaramos uma variável pra pegar o retorno do requisição do WebService:
    //bool ok = await LoginApi.login(login, senha); Antigo

    //Antes da ApiResponse:
    //Usuario user = await LoginApi.login(login, senha);
    ApiResponse response = await LoginApi.login(login, senha);

    //Validamos esse retorno, se estiver Ok, push pra outra tela:
    //if (ok) { Antigo

    //Antes da ApiResponse:
    //if (user != null) {
    if (response.ok) {
      Usuario user = response.result;

      print(">>> $user");
      push(context, HomePageS5(), replace: true);
    } else {
      //Antes da ApiResponse:
      //print("Login incorreto!");
      alert(context, "Carros", response.msg);
    }

    //Faz o CircularProgressIndicator parar de rodar:
    setState(() {
      _showProgress = false;
    });
  }

  //Valida se os campos estão digitados:
  String _validateLogin(String strText) {
    if (strText.isEmpty) {
      return "Digite o login!";
    }
    return null;
  }

  //Valida se os campos estão digitados:
  String _validateSenha(String strSenha) {
    if (strSenha.isEmpty) {
      return "Digite a senha!";
    }

    if (strSenha.length < 3) {
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
