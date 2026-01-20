import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/l10n/app_localizations.dart';
import 'package:story_app/src/features/auth/presentation/blocs/auth/auth_bloc.dart';

class LogoutDialogWidget extends StatelessWidget {
  const LogoutDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        AppLocalizations.of(context)!.logoutDialogText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => context.pop(),
              child: Text(AppLocalizations.of(context)!.no),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () =>
                  context.read<AuthBloc>().add(AuthLogoutRequested()),
              child: Text(AppLocalizations.of(context)!.yes),
            ),
          ),
        ],
      ),
    );
  }
}
