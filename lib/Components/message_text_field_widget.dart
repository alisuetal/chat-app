import 'package:flutter/material.dart';

class MessageTextFieldWidget extends StatefulWidget {
  final String? text;
  final String hint;
  final void Function(String value) anchor;
  final Future<void> Function() onSend;

  const MessageTextFieldWidget({
    Key? key,
    this.text,
    required this.anchor,
    required this.hint,
    required this.onSend,
  }) : super(key: key);

  @override
  State<MessageTextFieldWidget> createState() => _MessageTextFieldWidgetState();
}

class _MessageTextFieldWidgetState extends State<MessageTextFieldWidget> {
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
      borderRadius: const BorderRadius.all(Radius.circular(36)),
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
                hintStyle: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.black38),
                errorBorder: InputBorder.none,
                errorStyle: const TextStyle(
                  color: Colors.black,
                ),
                suffixIcon: GestureDetector(
                  onTap: _textController.text.isEmpty
                      ? null
                      : () {
                          widget.onSend();
                          _textController.clear();
                        },
                  child: const Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                    ),
                    child: Icon(
                      Icons.send_rounded,
                      size: 28,
                    ),
                  ),
                ),
              ),
              style: Theme.of(context).textTheme.headline3,
              cursorColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
