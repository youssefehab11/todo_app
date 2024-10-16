import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/fonts_manager.dart';
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
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.normal,
        fontFamily: FontsManager.poppins,
      ),
      cursorColor: theme.primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: LightTextStyles.text18WeightNormal,
        enabledBorder: TextFormFieldBorderStyle(theme.colorScheme.primary),
        focusedBorder: TextFormFieldBorderStyle(theme.primaryColor),
        errorBorder: TextFormFieldBorderStyle(Colors.red),
        filled: true,
        fillColor: theme.colorScheme.primary,
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
