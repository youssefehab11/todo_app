import 'package:flutter/material.dart';
import 'package:todo_app/core/widgets/default_route_logo.dart';
import 'package:todo_app/presentation/authentication/register/widgets/register_user_actions.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const RouteLogo(),
              RegisterUserActions()
            ],
          ),
        ),
      ),
    );
  }
}
