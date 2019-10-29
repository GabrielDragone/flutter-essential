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
        token = map["token"],
        //Exemplos 1, 2 e 3:
        //roles = getRoles(map);
        //Exemplo 4:
        roles = map["roles"] != null
            ? map["roles"].map<String>((role) => role.toString()).toList()
            : null;

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome, email: $email, token: $token, roles: $roles}';
  }

  static getRoles(Map<String, dynamic> map) {
    //Parser de lista:
    //Exemplo 1:
    //List list = map["roles"];
    /*List<String> roles = [];
    for (String role in list) {
      roles.add(role);
    }*/

    //Exemplo 2:
    //Percorre a lista e permite que seja retornado outra lista no lugar:
    //List<String> roles = list.map<String>((role) => role.toString()).toList();

    //Exemplo 3:
    //List<String> roles =
    //    map["roles"].map<String>((role) => role.toString()).toList();
    //return roles;
  }
}
