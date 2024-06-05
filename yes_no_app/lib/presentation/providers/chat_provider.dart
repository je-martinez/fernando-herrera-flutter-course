import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message_entity.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messages = [
    Message(text: 'Hola', fromWho: Sender.me),
    Message(text: 'Wow', fromWho: Sender.other)
  ];

  void sendMessage(String text) {
    print(text);
    final message = Message(text: text, fromWho: Sender.me);
    messages.add(message);
    notifyListeners();
  }
}
