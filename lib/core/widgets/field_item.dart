import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/core/widgets/default_text_form_field.dart';

class InputFieldItem extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final Validator validator;
  final String hintText;
  final bool isObscure;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  const InputFieldItem({
    super.key,
    required this.label,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    this.controller,
    this.validator,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: checkCurrentTheme(context)
              ? LightTextStyles.text18WeightBold
              : DarkTextStyles.text18WeightBold,
        ),
        const SizedBox(
          height: 8,
        ),
        DefaultTextFormField(
          hintText: hintText,
          validator: validator,
          controller: controller,
          isObscure: isObscure,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
        )
      ],
    );
  }
}
