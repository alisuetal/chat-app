import 'dart:io';

import 'package:chat/core/models/message_model.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final MessageModel message;
  final bool belongsToCurrentUser;
  final bool showUserInformation;

  const MessageWidget({
    Key? key,
    required this.message,
    required this.belongsToCurrentUser,
    required this.showUserInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: belongsToCurrentUser
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showUserInformation && !belongsToCurrentUser)
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        message.userName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            Container(
              decoration: BoxDecoration(
                color: belongsToCurrentUser
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.shade300,
                borderRadius: const BorderRadius.all(
                  Radius.circular(28),
                ),
              ),
              width: 180,
              padding: const EdgeInsets.only(
                left: 20,
                top: 14,
                right: 18,
                bottom: 12,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          message.text,
                          style: TextStyle(
                            color: belongsToCurrentUser
                                ? Colors.white
                                : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          message.createdAt.toString().substring(0, 19),
                          style: TextStyle(
                            color: belongsToCurrentUser
                                ? Colors.white38
                                : Colors.black38,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
