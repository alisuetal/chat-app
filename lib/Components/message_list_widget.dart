import 'package:chat/Components/message_widget.dart';
import 'package:chat/core/models/message_model.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class MessageListWidget extends StatelessWidget {
  const MessageListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;
    return StreamBuilder<List<MessageModel>>(
      stream: ChatService().messagesStream(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.only(
              top: 128,
            ),
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 128,
            ),
            child: Column(
              children: const [
                Icon(
                  Icons.message_rounded,
                  color: Colors.black38,
                  size: 32,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "No texts yet.",
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        } else {
          final msgs = snapshot.data!;
          return SizedBox(
            height: MediaQuery.of(context).size.height <= 600
                ? 400
                : MediaQuery.of(context).size.height * 0.66,
            child: ListView.builder(
              itemCount: msgs.length,
              itemBuilder: (ctx, i) {
                final sameUser = i - 1 >= 0
                    ? msgs[i - 1].userId == msgs[i].userId
                        ? true
                        : false
                    : false;

                return Padding(
                  padding: EdgeInsets.only(
                    top: sameUser ? 6 : 16,
                  ),
                  child: MessageWidget(
                    key: ValueKey(msgs[i].id),
                    message: msgs[i],
                    belongsToCurrentUser: currentUser?.id == msgs[i].userId,
                    showUserInformation: !sameUser,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
