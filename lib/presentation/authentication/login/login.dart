import 'package:flutter/material.dart';
import 'package:todo_app/core/widgets/default_route_logo.dart';
import 'package:todo_app/presentation/authentication/login/widgets/login_user_actions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const RouteLogo(),
              LoginUserActions(),
            ],
          ),
        ),
      ),
    );
  }
}
