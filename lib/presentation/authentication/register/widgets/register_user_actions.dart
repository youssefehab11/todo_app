import 'package:flutter/material.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/widgets/account_actions.dart';
import 'package:todo_app/core/widgets/default_button.dart';
import 'package:todo_app/core/widgets/field_item.dart';

class RegisterUserActions extends StatelessWidget {
  RegisterUserActions({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            buildFullNameField(),
            const SizedBox(
              height: heightBetweenFieldItems,
            ),
            buildEmailField(),
            const SizedBox(
              height: heightBetweenFieldItems,
            ),
            buildPasswordField(),
            const SizedBox(
              height: heightBetweenFieldItems,
            ),
            buildRePasswordField(),
            const SizedBox(
              height: heightBetweenFieldItemAndButton,
            ),
            DefaultButton(
              btnText: 'Sign Up',
              onPressed: () {},
            ),
            buildLoginRow(context),
          ],
        ),
      ),
    );
  }

  Widget buildFullNameField() {
    return InputFieldItem(
      label: 'Full Name',
      hintText: 'enter your full name',
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      controller: fullNameController,
      validator: (input) {
        return null;
      },
    );
  }

  Widget buildEmailField() {
    return InputFieldItem(
      label: 'Email Address',
      hintText: 'enter your email',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: emailController,
      validator: (input) {
        return null;
      },
    );
  }

  Widget buildPasswordField() {
    return InputFieldItem(
      label: 'Password',
      hintText: 'enter your password',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: passwordController,
      validator: (input) {
        return null;
      },
    );
  }

  Widget buildRePasswordField() {
    return InputFieldItem(
      label: 'Re-Password',
      hintText: 'enter your re-password',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      controller: rePasswordController,
      validator: (input) {
        return null;
      },
    );
  }

  Widget buildLoginRow(BuildContext context) {
    return AccountActions(
      labelText: 'Already have account?',
      btnText: 'Login',
      onPressed: () =>
          Navigator.of(context).pushReplacementNamed(Routes.loginRoute),
    );
  }
}
