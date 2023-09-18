class ThirdParty {
  bool _isLogin = false;

  ThirdParty({isLogin = false}) {
    _isLogin = isLogin;
  }

  void setLoginState() {
    _isLogin = !_isLogin;
  }

  bool get isLogin => _isLogin;
}
