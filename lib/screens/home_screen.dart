import 'package:chat/Components/app_bar_widget.dart';
import 'package:chat/Components/screen_holder_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHolderWidget(
      content: Column(
        children: [
          AppBarWidget(title: "Chat", backButton: false),
        ],
      ),
    );
  }
}
