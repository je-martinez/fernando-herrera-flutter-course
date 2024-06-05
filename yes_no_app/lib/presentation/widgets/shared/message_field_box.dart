import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.grey,
        ));

    final inputDecoration = InputDecoration(
        enabledBorder: outlineBorder,
        focusedBorder: outlineBorder,
        hintText: 'End your message with a "?"',
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            onValue(textController.text);
            textController.clear();
          },
          highlightColor: Colors.transparent,
        ));

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      maxLines: 1,
      keyboardType: TextInputType.multiline,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
