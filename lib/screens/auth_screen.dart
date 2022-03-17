import 'dart:async';

import 'package:chat/Components/app_bar_widget.dart';
import 'package:chat/Components/screen_holder_widget.dart';
import 'package:chat/core/models/auth_form_data.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import '../Components/auth_form_widget.dart';
import '../core/models/auth_form_data.dart';

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

  Future<void> _submit() async {
    try {
      setState(() {
        _isLoading = true;
      });
      if (_formData.authMethod == AuthFormMethod.login) {
        await AuthService().login(_formData.email, _formData.password);
      } else {
        await AuthService().signUp(_formData.name, _formData.email,
            _formData.password, _formData.image!);
      }
    } catch (error) {
      //
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
                const AppBarWidget(title: "Chat", backButton: false),
                AuthFormWidget(
                  formData: _formData,
                  fullForm: _formData.authMethod == AuthFormMethod.login
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
