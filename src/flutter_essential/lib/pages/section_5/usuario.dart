class Usuario {
  //Mesmos atributos do WebService:
  String login;
  String nome;
  String email;
  String token;
  List<String> roles;

  //Construtor:
  //Usuario(this.nome, this.email); Normal, passando os parâmetros
  //Usuario(Map<String, dynamic> map) { //Passando o responseMap diretamente
//  Usuario.fromJson(Map<String, dynamic> map) {
//    //Utilizados quando não tem os construtores padrões, mais conhecidos por namedConstructors
//    login = map["login"];
//    nome = map["nome"];
//    email = map["email"];
//    token = map["token"];
//  }
  //Sintaxe de lista de inicialização:
  Usuario.fromJson(Map<String, dynamic> map)
      : login = map["login"],
        nome = map["nome"],
        email = map["email"],
        token = map["token"];

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome, email: $email, token: $token, roles: $roles}';
  }
}
