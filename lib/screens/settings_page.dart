import 'package:chat/Components/app_bar_widget.dart';
import 'package:chat/Components/button_widget.dart';
import 'package:chat/Components/profile_information_widget.dart';
import 'package:chat/Components/screen_holder_widget.dart';
import 'package:chat/core/services/auth/auth_firebase_service.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = AuthService().currentUser;
    return ScreenHolderWidget(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppBarWidget(title: "Settings", backButton: false),
          ProfileInformationWidget(user: user!),
          const SizedBox(
            height: 32,
          ),
          ButtonWidget(
            text: "Log Out",
            materialIcon: Icons.logout_rounded,
            function: () => AuthFirebaseService().logout(),
            enabled: true,
          ),
        ],
      ),
    );
  }
}
