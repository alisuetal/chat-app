import 'package:flutter/material.dart';

class TextFieldStringWidget extends StatefulWidget {
  final String? text;
  final String hint;
  final bool hide;
  final void Function(String value) anchor;

  const TextFieldStringWidget({
    Key? key,
    this.text,
    required this.anchor,
    required this.hint,
    required this.hide,
  }) : super(key: key);

  @override
  State<TextFieldStringWidget> createState() => _TextFieldStringWidgetState();
}

class _TextFieldStringWidgetState extends State<TextFieldStringWidget> {
  final _textController = TextEditingController();

  @override
  void initState() {
    _textController.text = widget.text ?? "";
    _textController.addListener(() {
      setState(() {
        widget.anchor(_textController.text);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: SizedBox(
        height: 72,
        child: Stack(
          children: [
            TextFormField(
              maxLength: 120,
              controller: _textController,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.08),
                counterText: "",
                contentPadding: const EdgeInsets.only(
                  top: 24,
                  left: 24,
                  bottom: 20,
                  right: 48,
                ),
                hintText: widget.hint,
                errorBorder: InputBorder.none,
                errorStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
              style: Theme.of(context).textTheme.headline3,
              cursorColor: Colors.black,
              obscureText: widget.hide,
            ),
            if (_textController.text != "" && _textController.text.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _textController.text = "",
                          child: Container(
                            height: 28,
                            width: 28,
                            child: const Icon(
                              Icons.close_rounded,
                              color: Colors.black,
                              size: 16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Colors.black.withOpacity(0.08),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
