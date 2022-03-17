class MessageModel {
  final String id;
  final String text;
  final DateTime createdAt;
  //user data
  final String userId;
  final String userName;
  final String userImageURL;

  const MessageModel({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.userId,
    required this.userName,
    required this.userImageURL,
  });
}
