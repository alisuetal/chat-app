import 'dart:async';
import 'package:chat/core/models/message_model.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatFirebaseService implements ChatService {
  @override
  Stream<List<MessageModel>> messagesStream() {
    final storage = FirebaseFirestore.instance;
    final snapshots = storage
        .collection('chat')
        .withConverter(
          fromFirestore: _fromFirestore,
          toFirestore: _toFirestore,
        )
        .orderBy('createdAt')
        .snapshots();
    return snapshots.map((query) {
      return query.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  @override
  Future<MessageModel?> save(String text, ChatUser user) async {
    final storage = FirebaseFirestore.instance;

    final msg = MessageModel(
      id: '',
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageURL,
      userEmail: user.email,
    );

    final docRef = await storage
        .collection('chat')
        .withConverter(fromFirestore: _fromFirestore, toFirestore: _toFirestore)
        .add(msg);

    final doc = await docRef.get();
    return doc.data()!;
  }

  MessageModel _fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc, SnapshotOptions? options) {
    return MessageModel(
      id: doc.id,
      text: doc['text'],
      createdAt: DateTime.parse(doc['createdAt']),
      userId: doc['userId'],
      userName: doc['userName'],
      userImageURL: doc['userImageURL'],
      userEmail: doc['userEmail'],
    );
  }

  Map<String, dynamic> _toFirestore(MessageModel msg, SetOptions? options) {
    return {
      'text': msg.text,
      'createdAt': msg.createdAt.toIso8601String(),
      'userId': msg.userId,
      'userName': msg.userName,
      'userImageURL': msg.userImageURL,
      'userEmail': msg.userEmail
    };
  }
}
