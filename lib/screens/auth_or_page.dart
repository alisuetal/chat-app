import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/screens/auth_screen.dart';
import 'package:chat/screens/tab_screen.dart';
import 'package:chat/utils/tools.dart';
import 'package:flutter/material.dart';

class AuthOrPage extends StatelessWidget {
  const AuthOrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
        stream: AuthService().userChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            Tools().toggleWhiteBar();
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          } else {
            if (snapshot.hasData) {
              Tools().toggleGreyBar();
              return const TabScreen();
            } else {
              Tools().toggleWhiteBar();
              return const AuthScreen();
            }
          }
        },
      ),
    );
  }
}
