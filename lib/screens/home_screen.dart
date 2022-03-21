import 'package:chat/Components/app_bar_widget.dart';
import 'package:chat/Components/message_list_widget.dart';
import 'package:chat/Components/message_text_field_widget.dart';
import 'package:chat/Components/screen_holder_widget.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:chat/screens/auth_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _message = '';

  Future<void> _sendMessage() async {
    final user = AuthService().currentUser;

    if (user != null) {
      print("!");
      await ChatService().save(_message, user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenHolderWidget(
      content: Column(
        children: [
          const AppBarWidget(title: "Chat", backButton: false),
          const MessageListWidget(),
          MessageTextFieldWidget(
            anchor: (String value) {
              _message = value;
            },
            hint: "Type something...",
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}
