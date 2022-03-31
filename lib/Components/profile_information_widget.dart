import 'package:chat/core/models/chat_user.dart';
import 'package:flutter/material.dart';

class ProfileInformationWidget extends StatelessWidget {
  final ChatUser user;

  const ProfileInformationWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(user.imageURL),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                user.email,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.06),
        ),
      ),
    );
  }
}
