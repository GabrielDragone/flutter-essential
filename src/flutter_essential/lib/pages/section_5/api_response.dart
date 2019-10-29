//Classe responsável por verificar response da requisição:
class ApiResponse<T> {
  bool ok;
  String msg;
  T result; //Objeto genérico que será o return, acima tipamos a classe

  ApiResponse.ok(this.result) {
    ok = true;
  }

  ApiResponse.error(this.msg) {
    ok = false;
  }
}
