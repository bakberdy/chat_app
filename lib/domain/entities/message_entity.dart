class MessageEntity {
  final String messsage;
  final String senderUuid;
  final String receiverUuid;
  final DateTime createdAt;

  MessageEntity({required this.messsage, required this.senderUuid, required this.receiverUuid, required this.createdAt});
}