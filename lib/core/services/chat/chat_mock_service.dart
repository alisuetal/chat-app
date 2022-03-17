import 'dart:async';
import 'dart:math';
import 'package:chat/core/models/message_model.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<MessageModel> _msgs = [
    MessageModel(
      id: '3',
      text: 'Sim. Pode ser agora!',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'Teste',
      userImageURL: 'assets/images/avatar.jpg',
    ),
    MessageModel(
      id: '2',
      text: 'Teremos reunião hoje?',
      createdAt: DateTime.now(),
      userId: '456',
      userName: 'Ana',
      userImageURL: 'assets/images/avatar.jpg',
    ),
    MessageModel(
      id: '2',
      text: 'Bom dia.',
      createdAt: DateTime.now(),
      userId: '456',
      userName: 'Ana',
      userImageURL: 'assets/images/avatar.jpg',
    ),
    MessageModel(
      id: '1',
      text: 'Bom dia',
      createdAt: DateTime.now(),
      userId: '1',
      userName: 'User Test',
      userImageURL: 'assets/images/avatar.png',
    ),
  ];

  static MultiStreamController<List<MessageModel>>? _controller;
  static final _msgsStream = Stream<List<MessageModel>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<MessageModel>> messagesStream() {
    return _msgsStream;
  }

  @override
  Future<MessageModel> save(String text, ChatUser user) async {
    final newMessage = MessageModel(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageURL,
    );
    _msgs.add(newMessage);
    _controller?.add(_msgs);
    return newMessage;
  }
}
