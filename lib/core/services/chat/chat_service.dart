import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/models/message_model.dart';
import 'package:chat/core/services/chat/chat_mock_service.dart';

abstract class ChatService {
  Stream<List<MessageModel>> messagesStream();
  Future<MessageModel> save(String text, ChatUser user);

  factory ChatService() {
    return ChatMockService();
  }
}
