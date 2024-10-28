import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/core/utils/styles.dart';

class AccountActions extends StatelessWidget {
  final String labelText;
  final String btnText;
  final VoidCallback onPressed;
  const AccountActions(
      {super.key,
      required this.labelText,
      required this.btnText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labelText,
          style: isLight(context)
              ? LightTextStyles.text18WeightNormal
              : DarkTextStyles.text18WeightNormal,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            btnText,
            style: LightTextStyles.text18WeightNormal
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        )
      ],
    );
  }
}
