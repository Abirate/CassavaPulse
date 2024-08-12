import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageUserModelWidget extends StatelessWidget {

  final String message;
  final bool isFromUser;

  const MessageUserModelWidget({super.key, required this.message,
    required this.isFromUser,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isFromUser 
        ? MainAxisAlignment.end 
        : MainAxisAlignment.center, // start if displaying the two in schat_screen
      children: [
        Flexible(
          child: Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.85),
            decoration: BoxDecoration(
              color: isFromUser
                  ? Theme.of(context).colorScheme.surfaceContainerHighest
                  : Theme.of(context).colorScheme.primaryContainer, 
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: MarkdownBody(
              selectable: true,
              data: message,
            ),
          ),
        ),
      ],
    );
  }
}