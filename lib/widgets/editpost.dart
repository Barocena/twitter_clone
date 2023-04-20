// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class InputDialog extends StatefulWidget {
  final String title;
  final String hintText;
  final void Function(String) onOkPressed;

  const InputDialog({
    Key? key,
    required this.title,
    required this.hintText,
    required this.onOkPressed,
  }) : super(key: key);

  @override
  _InputDialogState createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _textController,
        decoration: InputDecoration(hintText: widget.hintText),
      ),
      actions: [
        TextButton(
          child: const Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            widget.onOkPressed(_textController.text);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}