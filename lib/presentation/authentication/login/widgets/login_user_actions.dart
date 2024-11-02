import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/utils/dialog_utils.dart';
import 'package:todo_app/core/utils/firebase_codes.dart';
import 'package:todo_app/core/utils/validator.dart';
import 'package:todo_app/core/widgets/account_actions.dart';
import 'package:todo_app/core/widgets/default_button.dart';
import 'package:todo_app/core/widgets/field_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/providers/auth_provider.dart';

class LoginUserActions extends StatelessWidget {
  LoginUserActions({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
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
                onPressed: () => onLoginPressed(context),
              ),
              const SizedBox(
                height: heightBetweenFieldItems,
              ),
              buildCreateAccountRow(context),
            ],
          ),
        ),
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
        return emailVaildator(input);
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
      isObscure: true,
      validator: (input) {
        return passwordValidator(input);
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

  void onLoginPressed(BuildContext context) {
    if (formKey.currentState?.validate() != false) {
      login(context);
    }
  }

  void login(BuildContext context) async {
    try {
      showLoadingDialog(context);
      final credential =
          await context.read<AppAuthProvider>().signInWithEmailAndPassword(
                emailController.text,
                passwordController.text,
              );
      if (context.mounted) hideLoadingDialog(context);
      if (context.mounted) {
        showMessageDialog(
          context,
          message: 'Logged In successfully',
          posActionTitle: 'Ok',
          posAction: () {
            Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      String message = 'Something went wrong';
      if (context.mounted) hideLoadingDialog(context);
      if (e.code == FirebaseCodes.userNotFound ||
          e.code == FirebaseCodes.wrongPassword ||
          e.code == FirebaseCodes.invalidCredential) {
        message = 'Wrong email or password.';
      }
      if (context.mounted) {
        showMessageDialog(context, message: message, posActionTitle: 'Ok');
      }
    }
  }
}
