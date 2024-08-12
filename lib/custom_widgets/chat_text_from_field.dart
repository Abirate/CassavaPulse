import 'package:flutter/material.dart';

class ChatTextFromField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool readOnly;
  final void Function(String)? onFieldSubmitted;

  const ChatTextFromField({
    super.key,
    this.controller,
    this.focusNode,
    this.readOnly = false,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      autocorrect: false,
      focusNode: focusNode,
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        hintText: 'Enter your prompt...',
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(32),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(32),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
        ),
      ),
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a prompt';
        }
        return null;
      },
    );
  }
}
