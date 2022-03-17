import 'dart:io';

import 'package:chat/core/models/message_model.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  static const _defaultImage = 'assets/images/avatar.png';
  final MessageModel message;
  final bool belongsToCurrentUser;
  final bool showUserInformation;

  const MessageWidget({
    Key? key,
    required this.message,
    required this.belongsToCurrentUser,
    required this.showUserInformation,
  }) : super(key: key);

  Widget _showUserImage(String imageURL) {
    ImageProvider? provider;
    final uri = Uri.parse(imageURL);

    if (uri.path.contains(_defaultImage)) {
      provider = const AssetImage(_defaultImage);
    } else if (uri.scheme.contains('http')) {
      provider = NetworkImage(uri.toString());
    } else {
      provider = FileImage(File(uri.toString()));
    }

    return SizedBox(
      height: 24,
      width: 24,
      child: CircleAvatar(
        backgroundImage: provider,
        backgroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: belongsToCurrentUser
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: belongsToCurrentUser
                ? Theme.of(context).colorScheme.primary
                : Colors.grey.shade300,
            borderRadius: const BorderRadius.all(
              Radius.circular(22),
            ),
          ),
          width: 180,
          padding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 20,
          ),
          child: Column(
            children: [
              if (showUserInformation && !belongsToCurrentUser)
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _showUserImage(message.userImageURL),
                        const SizedBox(
                          width: 6,
                        ),
                        Flexible(
                          child: Text(
                            message.userName,
                            style: TextStyle(
                              color: belongsToCurrentUser
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      message.text,
                      style: TextStyle(
                        color:
                            belongsToCurrentUser ? Colors.white : Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      message.createdAt.toString().substring(0, 19),
                      style: TextStyle(
                        color: belongsToCurrentUser
                            ? Colors.white
                            : Colors.black54,
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
    );
  }
}
