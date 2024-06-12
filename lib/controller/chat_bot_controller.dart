import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:vku_app/controller/api_constants.dart';

class ChatBotController extends GetxController {
  var messages = <Message>[].obs;

  void addMessage(Message message) {
    messages.insert(0, message);
  }

  Future<void> sendMessage(String text) async {
    var url = Uri.parse('${baseUrl}chatbot');
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'value': text,
      },
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData.containsKey('text')) {
        var botMessage = responseData['text'];
        addMessage(Message(text: botMessage, isBot: true));
      } else {
        addMessage(Message(text: 'Error: Invalid response from server', isBot: true));
      }
    } else {
      addMessage(Message(text: 'Error: ${response.statusCode}', isBot: true));
    }
  }
}

class Message {
  final String text;
  final bool isBot;

  Message({required this.text, required this.isBot});
}
