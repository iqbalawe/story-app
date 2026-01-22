import 'package:flutter/material.dart';
import 'package:story_app/l10n/app_localizations.dart';

class LockedFeatureContainer extends StatelessWidget {
  const LockedFeatureContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        children: [
          Icon(Icons.lock_outline, color: theme.colorScheme.onSecondary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.lockedFeatureInfo,
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.onSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
