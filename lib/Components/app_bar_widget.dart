import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final bool backButton;

  const AppBarWidget({required this.title, required this.backButton, Key? key})
      : super(key: key);

  void _selectCategory(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: title != '' ? 144.0 : 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisAlignment: backButton
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
          children: <Widget>[
            if (backButton == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 36,
                    ),
                    onTap: () {
                      _selectCategory(context);
                    },
                  ),
                ],
              ),
            if (title != '')
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Flexible(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ]),
          ],
        ),
      ),
    );
  }
}
