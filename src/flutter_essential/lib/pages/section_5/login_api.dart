import 'dart:convert';
import 'dart:math';

import 'package:flutter_essential/pages/section_5/api_response.dart';
import 'package:flutter_essential/pages/section_5/usuario.dart';
import 'package:http/http.dart'
    as http; //Utilizado o http como se estivessemos armazenando o import numa variável.

//Classe utilizada para encapsular a lógica para chamar o WebService:
class LoginApi {
  //Método login que recebe login e senha. Futuro tipado:
  //Antigo:
//  static Future<bool> login(String strLogin, String strSenha) async {
  //Novo, como foi criado uma Classe usuario, alterado:
  //Exemplo utilizando ApiResponse, tipo T generic = Usuario:
  //static Future<Usuario> login(String strLogin, String strSenha) async {
  static Future<ApiResponse<Usuario>> login(
      String strLogin, String strSenha) async {
    try {
      //Url do WebService:
      //Antiga:
      //var url = "http://livrowebservices.com.br/rest/login";
      //Nova com validação se existe ou não usuários:
      var url = "https://carros-springboot.herokuapp.com/api/v2/login";

      //Hashmap de String String:
      Map<String, String> headers = {
        "Content-Type": "application/json",
      };

      //Definimos os parâmetros (map) que serão enviados via post na requisição pro WebService:
      Map params = {
        'username': strLogin,
        'password': strSenha,
      };

      //Transforma o map em String para enviar no post. Nencessário importar biblioteca:
      String s = json.encode(params);

      // Faz a requisição via post, passando a url e parâmetros definidos acima. O wait significa que essa requisição pode demorar alguns
      //segundos para retornar. Além do await, na linha do método, devemos defini-lo como async:
      //Antigo:
      //var response = await http.post(url, body: params);

      //Como tempos que passar o headers, foi informado parâmetro novo:
      var response = await http.post(url, body: s, headers: headers);

      print("Response status: ${response.statusCode}.");
      print("Response body: ${response.body}.");

      //Pega a response que vem em String e converte para Map:
      Map mapResponse = json.decode(response.body);

      //Atrubui os valores das variáveis de acordo com o response:
      String nome = mapResponse["nome"];
      String email = mapResponse["email"];

      print("Nome: $nome - E-mail: $email");

//    Usuario user = Usuario(nome, email); Antigo
//    Usuario user = Usuario(mapResponse);

      //Tratamento de response:
      if (response.statusCode == 200) {
        Usuario user = Usuario.fromJson(mapResponse);

        //Antes da ApiResponse:
        //return user;
        return ApiResponse.ok(user);
      }

      return ApiResponse.error(mapResponse["error"]);

      //return true;
    } catch (error, exception) {
      print("Erro no login: $error $exception");

      return ApiResponse.error(
          "Não foi possível fazer login! Problema no login!");
    }
  }
}
