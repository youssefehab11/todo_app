import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/styles.dart';

class AccountActions extends StatelessWidget {
  final String labelText;
  final String btnText;
  final VoidCallback onPressed;
  const AccountActions({
    super.key,
    required this.labelText,
    required this.btnText,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labelText,
          style: LightTextStyles.text16WeightNormal,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            btnText,
            style: LightTextStyles.text16WeightNormal
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        )
      ],
    );
  }
}
