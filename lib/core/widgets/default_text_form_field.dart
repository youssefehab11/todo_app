import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/core/utils/styles.dart';

typedef Validator = String? Function(String?)?;

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Validator validator;
  final String hintText;
  final bool isObscure;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  const DefaultTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    this.controller,
    this.validator,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isObscure,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: isLight(context)
          ? LightTextStyles.text18WeightNormalInter
              .copyWith(color: Colors.black)
          : DarkTextStyles.text18WeightNormalInter,
      cursorColor: theme.primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: LightTextStyles.text18WeightNormalInter,
        enabledBorder: TextFormFieldBorderStyle(theme.primaryColorLight),
        focusedBorder: TextFormFieldBorderStyle(theme.primaryColor),
        errorBorder: TextFormFieldBorderStyle(Colors.red),
        focusedErrorBorder: TextFormFieldBorderStyle(Colors.red),
        filled: true,
        fillColor: theme.primaryColorLight,
      ),
    );
  }
}

class TextFormFieldBorderStyle extends OutlineInputBorder {
  TextFormFieldBorderStyle(Color color)
      : super(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color, width: 2),
        );
}
