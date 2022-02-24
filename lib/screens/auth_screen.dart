import 'dart:async';

import 'package:chat/Components/app_bar_widget.dart';
import 'package:chat/Components/screen_holder_widget.dart';
import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

import '../Components/auth_form_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formData = AuthFormData();
  bool _isLoading = false;

  void _toggleMethod() {
    setState(() {
      _formData.toggleMethod();
    });
  }

  void _submit() {
    setState(() {
      _isLoading = true;
      Timer(
        Duration(seconds: 4),
        () => setState(() {
          _isLoading = false;
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenHolderWidget(
      content: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                AppBarWidget(title: "Chat", backButton: false),
                AuthFormWidget(
                  formData: _formData,
                  fullForm: _formData.authMethod == AuthFormMethod.Login
                      ? false
                      : true,
                  function: () => _toggleMethod(),
                  submit: () => _submit(),
                ),
              ],
            ),
    );
  }
}
