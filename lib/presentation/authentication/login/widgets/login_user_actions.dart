import 'package:flutter/material.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/widgets/account_actions.dart';
import 'package:todo_app/core/widgets/default_button.dart';
import 'package:todo_app/core/widgets/field_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          buildEmailFieldItem(context),
          const SizedBox(
            height: heightBetweenFieldItems,
          ),
          buildPasswordFieldItem(context),
          const SizedBox(
            height: heightBetweenFieldItemAndButton,
          ),
          DefaultButton(
            btnText: AppLocalizations.of(context)!.login,
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

  Widget buildEmailFieldItem(BuildContext context) {
    return InputFieldItem(
      label: AppLocalizations.of(context)!.emailAddress,
      hintText: AppLocalizations.of(context)!.emailAddressHint,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (input) {
        return null;
      },
    );
  }

  Widget buildPasswordFieldItem(BuildContext context) {
    return InputFieldItem(
      label: AppLocalizations.of(context)!.password,
      hintText: AppLocalizations.of(context)!.passwordHint,
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
      labelText: AppLocalizations.of(context)!.dontHaveAccount,
      btnText: AppLocalizations.of(context)!.createAccount,
      onPressed: () =>
          Navigator.of(context).pushReplacementNamed(Routes.registerRoute),
    );
  }
}
