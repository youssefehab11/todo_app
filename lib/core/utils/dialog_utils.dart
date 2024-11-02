import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        content: const Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(
              width: 16,
            ),
            Text('Please wait...')
          ],
        ),
      );
    },
  );
}

void hideLoadingDialog(BuildContext context) {
  Navigator.pop(context);
}

void showMessageDialog(
  BuildContext context, {
  String? title,
  required String message,
  required String posActionTitle,
  String? negActionTitle,
  VoidCallback? posAction,
  VoidCallback? negAction,
}) {
  List<Widget> actions = [
    TextButton(
      onPressed: () {
        Navigator.pop(context);
        posAction?.call();
      },
      child: Text(posActionTitle),
    ),
  ];
  if (negActionTitle != null) {
    actions.add(
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          negAction?.call();
        },
        child: Text(negActionTitle),
      ),
    );
  }
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: title != null ? Text(title) : null,
        content: Text(message),
        actions: actions,
      );
    },
  );
}
