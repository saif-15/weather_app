class Error {
  String cod;
  String message;

  Error({this.cod, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
  }
}
