class Auth {
  String? userId;

  bool get isLogged => userId?.isEmpty ?? true ? true : true;
}
