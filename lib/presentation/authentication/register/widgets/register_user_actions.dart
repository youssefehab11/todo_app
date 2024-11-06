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

class RegisterUserActions extends StatelessWidget {
  RegisterUserActions({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
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
                onPressed: () {
                  signUpPressed(context);
                },
              ),
              buildLoginRow(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFullNameField(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return InputFieldItem(
      label: appLocalizations.fullName,
      hintText: AppLocalizations.of(context)!.fullNameHint,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      controller: fullNameController,
      validator: (input) {
        FullNameValidaror fullNameValidaror = FullNameValidaror(
          fieldName: appLocalizations.fullName,
          emptyFieldErrorMessage: appLocalizations.cantBeEmpty,
          fieldErrorMessage: appLocalizations.fullNameFieldError,
        );
        return fullNameValidaror.validate(input);
      },
    );
  }

  Widget buildEmailField(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return InputFieldItem(
      label: appLocalizations.emailAddress,
      hintText: appLocalizations.emailAddressHint,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: emailController,
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

  Widget buildPasswordField(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return InputFieldItem(
      label: appLocalizations.password,
      hintText: appLocalizations.passwordHint,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: passwordController,
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

  Widget buildRePasswordField(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return InputFieldItem(
      label: appLocalizations.rePassword,
      hintText: appLocalizations.rePasswordHint,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      controller: rePasswordController,
      isObscure: true,
      validator: (input) {
        RePasswordValidator passwordValidator = RePasswordValidator(
          fieldName: appLocalizations.rePassword,
          emptyFieldErrorMessage: appLocalizations.cantBeEmpty,
          fieldErrorMessage: appLocalizations.passwordDoesntMatch,
          password: passwordController.text,
        );
        return passwordValidator.validate(input);
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

  void signUpPressed(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      createAccount(context);
    }
  }

  void createAccount(BuildContext context) async {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    try {
      showLoadingDialog(context);
      await context.read<AppAuthProvider>().createUserWithEmailAndPassword(
            emailController.text,
            passwordController.text,
            fullNameController.text,
          );

      if (context.mounted) hideLoadingDialog(context);
      if (context.mounted) {
        showMessageDialog(
          context,
          message: appLocalizations.accountCreatedSuccessfully,
          posActionTitle: appLocalizations.ok,
          posAction: () =>
              Navigator.of(context).pushReplacementNamed(Routes.homeRoute),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) hideLoadingDialog(context);
      String message = appLocalizations.somethingWentWrong;
      if (e.code == FirebaseCodes.weakPassword) {
        message = appLocalizations.weakPassword;
      } else if (e.code == FirebaseCodes.emailAlreadyInUse) {
        message = appLocalizations.emailAlreadyExists;
      }
      if (context.mounted) {
        showMessageDialog(
          context,
          message: message,
          posActionTitle: appLocalizations.ok,
        );
      }
    } catch (e) {
      String message = appLocalizations.somethingWentWrong;
      if (context.mounted) {
        showMessageDialog(
          context,
          message: message,
          posActionTitle: appLocalizations.ok,
        );
      }
    }
  }
}
