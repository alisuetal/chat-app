import 'dart:io';

enum AuthFormMethod { signup, login }

class AuthFormData {
  String name = '';
  String email = '';
  String password = '';
  File? image;
  AuthFormMethod _authMethod = AuthFormMethod.login;

  AuthFormMethod get authMethod {
    return _authMethod;
  }

  void toggleMethod() {
    _authMethod = _authMethod == AuthFormMethod.login
        ? AuthFormMethod.signup
        : AuthFormMethod.login;
  }
}
