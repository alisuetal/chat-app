import 'package:flutter/material.dart';

class ScreenHolderWidget extends StatelessWidget {
  final Widget content;

  const ScreenHolderWidget({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 40,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  screenSize.height < 620 ? 620 : screenSize.height * 0.87,
              maxWidth: 640,
              minWidth: 256,
            ),
            child: content,
          ),
        ),
      ),
    );
  }
}
