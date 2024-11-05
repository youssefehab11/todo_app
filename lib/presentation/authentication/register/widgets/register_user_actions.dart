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
    return InputFieldItem(
      label: AppLocalizations.of(context)!.fullName,
      hintText: AppLocalizations.of(context)!.fullNameHint,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      controller: fullNameController,
      validator: (input) {
        return fullNameValidator(input);
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
        return emailVaildator(input);
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
      isObscure: true,
      validator: (input) {
        return passwordValidator(input);
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
      isObscure: true,
      validator: (input) {
        return rePasswordValidator(
            password: passwordController.text, rePassword: input);
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
          message: 'Account created successfully',
          posActionTitle: 'Ok',
          posAction: () =>
              Navigator.of(context).pushReplacementNamed(Routes.homeRoute),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) hideLoadingDialog(context);
      String message = 'Something wnt wrong';
      if (e.code == FirebaseCodes.weakPassword) {
        message = 'The password provided is too weak.';
      } else if (e.code == FirebaseCodes.emailAlreadyInUse) {
        message = 'The account already exists for that email.';
      }
      if (context.mounted) {
        showMessageDialog(
          context,
          message: message,
          posActionTitle: 'ok',
        );
      }
    } catch (e) {
      String message = 'Something wnt wrong';
      if (context.mounted) {
        showMessageDialog(
          context,
          message: message,
          posActionTitle: 'ok',
        );
      }
    }
  }
}
