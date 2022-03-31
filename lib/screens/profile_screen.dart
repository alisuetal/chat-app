import 'package:chat/Components/app_bar_widget.dart';
import 'package:chat/Components/profile_information_widget.dart';
import 'package:chat/Components/screen_holder_widget.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as ChatUser;
    return ScreenHolderWidget(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppBarWidget(title: "Profile", backButton: true),
          ProfileInformationWidget(user: user),
          const SizedBox(
            height: 64,
          ),
        ],
      ),
    );
  }
}
