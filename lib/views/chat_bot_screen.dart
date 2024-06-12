import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vku_app/widgets/text_widget.dart';
import 'package:vku_app/widgets/appbar_widget.dart';
import 'package:vku_app/controller/chat_bot_controller.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(text: 'Chat AI'),
      body: Column(
        children: [
          const Expanded(child: ChatMessages()),
          ChatInput(),
        ],
      ),
    );
  }
}

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatBotController chatController = Get.put(ChatBotController());

    return Obx(() {
      if (chatController.messages.isEmpty) {
        return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text127Widget(text: 'Hello Nice to see you here!', fontSize: 24,),
              const SizedBox(height: 8,),
              text127Widget(text: 'May I help you?', fontSize: 24,),
            ],
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            reverse: true,
            itemCount: chatController.messages.length,
            itemBuilder: (context, index) {
              final message = chatController.messages[index];
              return Align(
                alignment: message.isBot ? Alignment.centerLeft : Alignment.centerRight,
                child: Container(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  decoration: BoxDecoration(
                    color: message.isBot ? Colors.white : const Color.fromRGBO(79, 160, 171, 1),
                    border: message.isBot ? Border.all(
                      width: 1,
                      color: const Color.fromRGBO(227, 227, 227, 1),
                    ) : Border.all(color: const Color.fromRGBO(79, 160, 171, 1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.text,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: message.isBot ? const Color.fromRGBO(127, 127, 127, 1) : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}

class ChatInput extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  ChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatBotController chatController = Get.put(ChatBotController());

    return Container(
      height: 72,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(191, 191, 191, 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, bottom: 12, left: 20),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(102, 112, 133, 1),
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your message',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(102, 112, 133, 1),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              iconSize: 28,
              color: const Color.fromRGBO(191, 191, 191, 1),
              onPressed: () {
                final text = _controller.text;
                if (text.isNotEmpty) {
                  chatController.addMessage(Message(text: text, isBot: false));
                  _controller.clear();
                  chatController.sendMessage(text); // Gửi tin nhắn đến API
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
