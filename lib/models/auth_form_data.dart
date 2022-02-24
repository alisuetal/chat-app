import 'dart:io';

enum AuthFormMethod { Signup, Login }

class AuthFormData {
  String name = '';
  String email = '';
  String password = '';
  File? image;
  AuthFormMethod _authMethod = AuthFormMethod.Login;

  AuthFormMethod get authMethod {
    return _authMethod;
  }

  void toggleMethod() {
    _authMethod = _authMethod == AuthFormMethod.Login
        ? AuthFormMethod.Signup
        : AuthFormMethod.Login;
  }
}
