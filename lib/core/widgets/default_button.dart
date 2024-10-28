import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/styles.dart';

class DefaultButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;

  const DefaultButton({
    super.key,
    required this.btnText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Theme.of(context).primaryColor)),
      height: 50,
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      minWidth: double.infinity,
      child: Text(
        btnText,
        style: LightTextStyles.text18WeightNormalInter
            .copyWith(color: Colors.white),
      ),
    );
  }
}
