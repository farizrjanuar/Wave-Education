import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmDialog({
    Key? key,
    this.title = 'Confirm',
    this.message = 'Are you sure?',
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text('No'),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          child: const Text('Yes'),
        ),
      ],
    );
  }
}

// Usage:
