import 'package:flutter/material.dart';
import 'package:todo_app/core/widgets/default_button.dart';

class ConfirmButton extends StatelessWidget {
  final VoidCallback onDonePressed;
  const ConfirmButton({super.key, required this.onDonePressed});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(btnText: 'Done', onPressed: onDonePressed);
  }
}
