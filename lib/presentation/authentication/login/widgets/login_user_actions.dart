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
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return InputFieldItem(
      label: appLocalizations.emailAddress,
      hintText: appLocalizations.emailAddressHint,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (input) {
        EmailValidator emailValidator = EmailValidator(
          fieldName: appLocalizations.emailAddress,
          emptyFieldErrorMessage: appLocalizations.cantBeEmpty,
          fieldErrorMessage: appLocalizations.enterCorrectEmail,
        );
        return emailValidator.validate(input);
      },
    );
  }

  Widget buildPasswordFieldItem(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return InputFieldItem(
      label: appLocalizations.password,
      hintText: appLocalizations.passwordHint,
      controller: passwordController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      isObscure: true,
      validator: (input) {
        PasswordValidator passwordValidator = PasswordValidator(
          fieldName: appLocalizations.password,
          emptyFieldErrorMessage: appLocalizations.cantBeEmpty,
          fieldErrorMessage: appLocalizations.passwordTooWeak,
        );
        return passwordValidator.validate(input);
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
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      showLoadingDialog(context);
      await context.read<AppAuthProvider>().signInWithEmailAndPassword(
            emailController.text,
            passwordController.text,
          );
      if (context.mounted) hideLoadingDialog(context);
      if (context.mounted) {
        showMessageDialog(
          context,
          message: appLocalizations.loggedInSuccessfully,
          posActionTitle: appLocalizations.ok,
          posAction: () {
            Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      String message = appLocalizations.somethingWentWrong;
      if (context.mounted) hideLoadingDialog(context);
      if (e.code == FirebaseCodes.userNotFound ||
          e.code == FirebaseCodes.wrongPassword ||
          e.code == FirebaseCodes.invalidCredential) {
        message = appLocalizations.wrongEmailOrPassword;
      }
      if (context.mounted) {
        showMessageDialog(context,
            message: message, posActionTitle: appLocalizations.ok);
      }
    }
  }
}
