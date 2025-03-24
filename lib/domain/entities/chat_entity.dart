import 'package:chat_app/domain/entities/message_entity.dart';
import 'package:chat_app/domain/entities/user_entity.dart';

class ChatEntity {
  final List<MessageEntity> messages; 
  final String chatId;

   final UserEntity sender;

   final MessageEntity lastMessage;

  ChatEntity({required this.lastMessage, required this.sender, required this.messages, required this.chatId});
}