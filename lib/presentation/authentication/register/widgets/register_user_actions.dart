import 'package:flutter/material.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/widgets/account_actions.dart';
import 'package:todo_app/core/widgets/default_button.dart';
import 'package:todo_app/core/widgets/field_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            buildFullNameField(context),
            const SizedBox(
              height: heightBetweenFieldItems,
            ),
            buildEmailField(context),
            const SizedBox(
              height: heightBetweenFieldItems,
            ),
            buildPasswordField(context),
            const SizedBox(
              height: heightBetweenFieldItems,
            ),
            buildRePasswordField(context),
            const SizedBox(
              height: heightBetweenFieldItemAndButton,
            ),
            DefaultButton(
              btnText: AppLocalizations.of(context)!.signup,
              onPressed: () {},
            ),
            buildLoginRow(context),
          ],
        ),
      ),
    );
  }

  Widget buildFullNameField(BuildContext context) {
    return InputFieldItem(
      label: AppLocalizations.of(context)!.fullName,
      hintText: AppLocalizations.of(context)!.fullNameHint,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      controller: fullNameController,
      validator: (input) {
        return null;
      },
    );
  }

  Widget buildEmailField(BuildContext context) {
    return InputFieldItem(
      label: AppLocalizations.of(context)!.emailAddress,
      hintText: AppLocalizations.of(context)!.emailAddressHint,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: emailController,
      validator: (input) {
        return null;
      },
    );
  }

  Widget buildPasswordField(BuildContext context) {
    return InputFieldItem(
      label: AppLocalizations.of(context)!.password,
      hintText: AppLocalizations.of(context)!.passwordHint,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: passwordController,
      validator: (input) {
        return null;
      },
    );
  }

  Widget buildRePasswordField(BuildContext context) {
    return InputFieldItem(
      label: AppLocalizations.of(context)!.rePassword,
      hintText: AppLocalizations.of(context)!.rePasswordHint,
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
      labelText: AppLocalizations.of(context)!.alreadyHaveAccount,
      btnText: AppLocalizations.of(context)!.login,
      onPressed: () =>
          Navigator.of(context).pushReplacementNamed(Routes.loginRoute),
    );
  }
}
