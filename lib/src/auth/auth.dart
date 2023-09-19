class Auth {
  String? _userId;

  bool get isLogged {
    if (_userId == null) {
      return false;
    }

    if (_userId!.isEmpty) {
      return false;
    }

    return true;
  }

  String? get userId => _userId;

  void userLogin(userId) {
    _userId = userId;
  }
}
