import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/providers/auth_provider.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const DefaultAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        InkWell(
          onTap: () => logout(context),
          child: const Icon(Icons.logout),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  void logout(BuildContext context) {
    context.read<AppAuthProvider>().logout();
    Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
  }
}
