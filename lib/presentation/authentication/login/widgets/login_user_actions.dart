import 'package:flutter/material.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/widgets/account_actions.dart';
import 'package:todo_app/core/widgets/default_button.dart';
import 'package:todo_app/core/widgets/field_item.dart';

class LoginUserActions extends StatelessWidget {
  LoginUserActions({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          buildEmailFieldItem(),
          const SizedBox(
            height: heightBetweenFieldItems,
          ),
          buildPasswordFieldItem(),
          const SizedBox(
            height: heightBetweenFieldItemAndButton,
          ),
          DefaultButton(
            btnText: 'Login',
            onPressed: () {},
          ),
          const SizedBox(
            height: heightBetweenFieldItems,
          ),
          buildCreateAccountRow(context),
        ],
      ),
    );
  }

  Widget buildEmailFieldItem() {
    return InputFieldItem(
      label: 'Email Address',
      hintText: 'enter your email',
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (input) {
        return null;
      },
    );
  }

  Widget buildPasswordFieldItem() {
    return InputFieldItem(
      label: 'Password',
      hintText: 'enter your password',
      controller: passwordController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      validator: (input) {
        return null;
      },
    );
  }

  Widget buildCreateAccountRow(BuildContext context) {
    return AccountActions(
      labelText: 'Don\'t have account?',
      btnText: 'Create Account',
      onPressed: () =>
          Navigator.of(context).pushReplacementNamed(Routes.registerRoute),
    );
  }
}
