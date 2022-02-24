import 'dart:io';

import 'package:chat/Components/button_widget.dart';
import 'package:chat/Components/text_field_string_widget.dart';
import 'package:chat/Components/user_image_picker_widget.dart';
import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthFormWidget extends StatefulWidget {
  final AuthFormData formData;
  final bool fullForm;
  final void Function() function;
  final void Function() submit;
  const AuthFormWidget({
    required this.formData,
    required this.fullForm,
    required this.function,
    required this.submit,
    Key? key,
  }) : super(key: key);

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  final _formKey = GlobalKey<FormState>();
  String _imageError = "";
  String _nameError = "";
  String _emailError = "";
  String _passwordError = "";

  bool _nameValidation() {
    if (widget.formData.name.trim().length < 5) {
      return false;
    } else {
      return true;
    }
  }

  bool _emailValidation() {
    final value = widget.formData.email;
    if (value.trim().length < 5 ||
        !value.contains('@') ||
        value.lastIndexOf('.') < value.lastIndexOf('@') ||
        value.allMatches('@').length > 1) {
      return false;
    } else {
      return true;
    }
  }

  bool _passwordValidation() {
    if (widget.formData.password.length < 8) {
      return false;
    } else {
      return true;
    }
  }

  void _setImage(File file) {
    setState(() {
      widget.formData.image = file;
    });
  }

  void _submit() {
    String _imageError =
        widget.formData.image == null ? "Escolha uma imagem." : "";
    String _nameError = "";
    String _emailError = "";
    String _passwordError = "";

    if (!_nameValidation() &&
        widget.formData.authMethod == AuthFormMethod.Signup) {
      _nameError = "Nome deve ter no mínino 5 caracteres.";
    }
    if (!_emailValidation()) {
      _emailError = "E-mail inválido.";
    }
    if (!_passwordValidation()) {
      _passwordError = "Senha deve ter no mínino 8 caracteres.";
    }

    setState(() {
      this._imageError = _imageError;
      this._nameError = _nameError;
      this._emailError = _emailError;
      this._passwordError = _passwordError;
    });

    if (_nameError.isEmpty &&
        _emailError.isEmpty &&
        _passwordError.isEmpty &&
        _imageError.isEmpty) {
      widget.submit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.fullForm)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          UserImagePicker(anchor: _setImage),
                          if (_imageError.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                _imageError,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Nome",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextFieldStringWidget(
                    anchor: (String value) {
                      widget.formData.name = value;
                    },
                    text: widget.formData.name,
                    hint: "Nome",
                    hide: false,
                  ),
                  if (_nameError.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        _nameError,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "E-mail",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextFieldStringWidget(
                  anchor: (String value) {
                    widget.formData.email = value;
                  },
                  text: widget.formData.email,
                  hint: "Email",
                  hide: false,
                ),
                if (_emailError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      _emailError,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Senha",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextFieldStringWidget(
                  anchor: (String value) {
                    widget.formData.password = value;
                  },
                  text: widget.formData.password,
                  hint: "Senha",
                  hide: true,
                ),
                if (_passwordError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      _passwordError,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          ButtonWidget(
            text: widget.fullForm ? "Cadastrar" : "Entrar",
            materialIcon: Icons.arrow_forward_rounded,
            function: _submit,
            enabled: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: widget.function,
                child: Text(
                  !widget.fullForm
                      ? "Criar nova conta"
                      : "Entrar com conta existente",
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
