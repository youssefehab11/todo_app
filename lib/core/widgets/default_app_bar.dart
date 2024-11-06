import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/core/utils/dialog_utils.dart';
import 'package:todo_app/core/utils/helper_functions.dart';
import 'package:todo_app/providers/auth_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => logout(context),
            child: isEnglish(context)
                ? const Icon(Icons.logout)
                : Transform.flip(
                    flipX: true,
                    child: const Icon(
                      Icons.logout,
                    ),
                  ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  void logout(BuildContext context) {
    showMessageDialog(
      context,
      message: AppLocalizations.of(context)!.confirmLogoutMessage,
      posActionTitle: AppLocalizations.of(context)!.yes,
      posAction: () async {
        await context.read<AppAuthProvider>().logout();
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
        }
      },
      negActionTitle: AppLocalizations.of(context)!.no,
    );
  }
}
